import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/core/helpers/user_local_helper.dart';
import 'package:blog_app/features/home/logic/cubit/home_cubit.dart';
import 'package:blog_app/features/home/screens/home/widgets/article_card.dart';
import 'package:blog_app/features/home/screens/home/widgets/home_appbar.dart';
import 'package:blog_app/features/home/screens/home/widgets/large_post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = HomeCubit.get(context)..getArticles();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(CustomSizes.defaultSpace)
            .copyWith(bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //? appbar
            const CustomHomeAppBar(),
            const SizedBox(height: CustomSizes.spaceBtwSections),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeArticlesLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                int index = cubit.articles.indexWhere(
                  (article) => article.userId == UserLocal.user!.id,
                );
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //? my recent article
                    if(index != -1) CustomLargePostCard(
                      margin:
                          const EdgeInsets.only(bottom: CustomSizes.spaceBtwSections),
                      article: cubit.articles[index],
                    ),
                    //? articles
                    ...List.generate(
                      cubit.articles.length,
                      (i) => CustomArticleCard(
                        article: cubit.articles[i],
                      ),
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
