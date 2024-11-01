
import 'package:blog_app/core/common/widgets/text_fields/text_field.dart';
import 'package:blog_app/core/constants/app_colors.dart';
import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/core/constants/styles.dart';
import 'package:blog_app/features/article/logic/category_cubit/category_cubit.dart';
import 'package:blog_app/features/home/screens/home/widgets/small_post_card.dart';
import 'package:blog_app/features/search/screens/search/widgets/filter_list_ship.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:iconsax/iconsax.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryCubit.get(context).getCategories();
    return Column(
      children: [
        AppBar(
          title: const Text("Search"),
        ),
        SingleChildScrollView(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomTextField(
                hint: "Search here ...",
                prefix: Icon(Iconsax.search_normal_1),
              ),
              // filter chips
              Padding(
                padding: const EdgeInsets.symmetric(vertical: CustomSizes.spaceBtwItems),
                child: BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (context, state) {
                    if (state is CategoryLoading || state is CategoryFailure) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return CustomFilterChipList( // success state
                      categories: CategoryCubit.get(context).categories,
                      onSelectionChanged: (category) {},
                    );
                  },
                ),
              ),
              //? result count
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Search Results",
                      style: TextStyles.medium14.copyWith(color: Colors.grey)),
                  Text(
                    "1 Founds",
                    style: TextStyles.semibold14
                        .copyWith(color: AppColors.primary),
                  )
                ],
              ),
              const SizedBox(height: CustomSizes.spaceBtwItems),
              const CustomSmallPostCard()
            ],
          ),
        ),
      ],
    );
  }
}
