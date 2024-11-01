import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/features/layout/screens/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_app/core/constants/app_colors.dart';
import 'package:blog_app/features/layout/data/data_source/local/bottom_navigation_data.dart';
import 'package:blog_app/features/layout/logic/cubit/app_layout_cubit.dart';

import '../data/models/bottom_navigation_model.dart';

class AppLayoutScreen extends StatefulWidget {
  const AppLayoutScreen({super.key});
  @override
  State<AppLayoutScreen> createState() => _AppLayoutScreenState();
}

class _AppLayoutScreenState extends State<AppLayoutScreen> {
  List<BottomNavigationModel> data = BottomNavigationData.get;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppLayoutCubit>();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      extendBody: true, 
      drawer: const CustomAppDrawer(),
      floatingActionButton: Container(
        margin: const EdgeInsets.all(CustomSizes.defaultSpace),
        // decoration: const ShapeDecoration(
        //   shape: StadiumBorder(side: BorderSide(color: AppColors.softGrey)),
        // ),
        child: BlocBuilder<AppLayoutCubit, AppLayoutState>(
          builder: (context, state) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                backgroundColor: AppColors.darkOne,
                selectedItemColor: AppColors.primary,
                unselectedItemColor: Colors.white54,
                currentIndex: state is PageChanged ? state.pageIndex : 0,
                type: BottomNavigationBarType.fixed,
                onTap: (tapedIndex) {
                  cubit.changePage(tapedIndex);
                },
                items: data
                    .map(
                      (item) => BottomNavigationBarItem(
                        icon: Icon(item.icon),
                        activeIcon: Icon(item.activeIcon),
                        label: "home",
                      ),
                    )
                    .toList(),
              ),
            );
          },
        ),
      ),
      body: BlocBuilder<AppLayoutCubit, AppLayoutState>(
        builder: (context, state) {
          if (state is PageChanged) {
            return data.elementAt(state.pageIndex).screen;
          }
          return data.elementAt(0).screen; // default page at index 0 (home)
        },
      ),
    );
  }
}
