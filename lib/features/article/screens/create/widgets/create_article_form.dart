import 'dart:io';

import 'package:blog_app/core/common/widgets/buttons/elevated_button.dart';
import 'package:blog_app/core/common/widgets/text_fields/text_field.dart';
import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/core/constants/styles.dart';
import 'package:blog_app/core/helpers/extensions.dart';
import 'package:blog_app/features/article/logic/article_cubit/article_cubit.dart';
import 'package:blog_app/features/article/screens/create/widgets/custom_category_drop_down.dart';
import 'package:blog_app/features/article/screens/create/widgets/text_section_with_star.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CustomCreateArticleForm extends StatelessWidget {
  const CustomCreateArticleForm({super.key, this.image});
  final File? image;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    late int categoryId;
    final titleController = TextEditingController();
    final bodyController = TextEditingController();
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Article Details",
            style: TextStyles.semibold22,
          ),
          const SizedBox(height: CustomSizes.spaceBtwItems),
          //? article title
          const CustomRequiredTextSection(title: "Title"),
          CustomTextField(
            fillColor: Colors.transparent,
            hint: "Title",
            controller: titleController,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          const SizedBox(height: CustomSizes.spaceBtwItems),
          //? article category dropdown
          const CustomRequiredTextSection(title: "Category"),
          CustomCategoryDropDownMenu(
            onSelected: (category) {
              categoryId = category!.id;
            },
          ),
          //? article body
          const SizedBox(height: CustomSizes.spaceBtwItems),
          const CustomRequiredTextSection(title: "Article"),
          SizedBox(
            height: 150,
            child: CustomTextField(
              expands: true,
              minLines: null,
              maxLines: null,
              controller: bodyController,
              keyboardType: TextInputType.multiline,
              fillColor: Colors.transparent,
              hint: "Type Article Content here ...",
            ),
          ),
          const SizedBox(height: CustomSizes.spaceBtwSections),
          BlocConsumer<ArticleCubit, ArticleState>(
            listener: (context, state) {
              if (state is CreateArticleSuccess) {
                state.message.showAsToast(Colors.green);
              } else if (state is CreateArticleFailure) {
                state.message.showAsToast(Colors.red);
              }
            },
            builder: (context, state) {
              if (state is CreateArticleLoading) {
                return const CustomElevatedButton(
                  onTap: null,
                  isLoading: true,
                  title: "Create",
                );
              }
              return CustomElevatedButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    ArticleCubit.get(context).create(
                      categoryId: categoryId,
                      title: titleController.text,
                      body: bodyController.text,
                    );
                    // showDialog(
                    //   context: context,
                    //   builder: (context) => const CustomSuccessDialog(
                    //     title: "Article Created Successfully",
                    //   ),
                    // );
                  }
                },
                title: "Create",
              );
            },
          )
        ],
      ),
    );
  }
}
