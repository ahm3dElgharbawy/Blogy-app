import 'dart:io';

import 'package:blog_app/core/common/widgets/appbars/main_appbar.dart';
import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/features/article/screens/create/widgets/create_article_form.dart';
import 'package:blog_app/features/article/screens/create/widgets/upload_button.dart';
import 'package:flutter/material.dart';


class CreateArticleScreen extends StatelessWidget {
  const CreateArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    File? image;
    return Scaffold(
      appBar: const CustomMainAppBar(
        title: "Create New Article",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //? post image pick
              CustomUploadButton(
                onUpload: (file) {
                  image = file;
                },
              ),
              const Divider(height: 50),
              //? article details form
              CustomCreateArticleForm(image: image,)
            ],
          ),
        ),
      ),
    );
  }
}
