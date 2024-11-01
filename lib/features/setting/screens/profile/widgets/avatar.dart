import 'dart:io';

import 'package:blog_app/core/common/widgets/containers/circular_container.dart';
import 'package:blog_app/core/constants/app_colors.dart';
import 'package:blog_app/core/constants/images_strings.dart';
import 'package:blog_app/core/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class CustomProfileAvatarWithEditIcon extends StatefulWidget {
  const CustomProfileAvatarWithEditIcon({super.key});

  @override
  State<CustomProfileAvatarWithEditIcon> createState() =>
      _CustomProfileAvatarWithEditIconState();
}

class _CustomProfileAvatarWithEditIconState
    extends State<CustomProfileAvatarWithEditIcon> {
  File? avatar;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: context.setHeight(40),
          backgroundImage:avatar!= null ? FileImage(avatar!): const AssetImage(ImagesStrings.image),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: CustomCircularContainer(
            height: context.setHeight(30),
            width: context.setHeight(30),
            onTap: () async {
              XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
              if(file != null){
                setState(() {
                  avatar = File(file.path);
                });
              }
            },
            color: AppColors.primary,
            child: const Icon(Icons.edit, color: Colors.white),
          ),
        )
      ],
    );
  }
}
