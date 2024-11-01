import 'dart:io';

import 'package:blog_app/core/common/widgets/containers/circular_container.dart';
import 'package:blog_app/core/common/widgets/containers/rounded_container.dart';
import 'package:blog_app/core/constants/app_colors.dart';
import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/core/constants/styles.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class CustomUploadButton extends StatefulWidget {
  const CustomUploadButton({super.key, required this.onUpload});
  final ValueChanged<File> onUpload;

  @override
  State<CustomUploadButton> createState() => _CustomUploadButtonState();
}

class _CustomUploadButtonState extends State<CustomUploadButton> {
  File? image;
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      strokeWidth: 2,
      color: Colors.grey,
      borderType: BorderType.RRect,
      radius: const Radius.circular(10),
      dashPattern: const [5, 5],
      child: Stack(
        children: [
          CustomRoundedContainer(
            radius: 10,
            width: double.infinity,
            height: 150,
            padding: EdgeInsets.zero,
            child: Material(
              // to show inkwell splash, using the Material widget
              color: Colors.transparent,
              child: SizedBox.expand(
                child: InkWell(
                  onTap: image != null
                      ? null
                      : () async {
                          final XFile? file = await ImagePicker()
                              .pickImage(source: ImageSource.gallery)
                              .catchError((e) => e);
                          if (file != null) {
                            image = File(file.path);
                            widget.onUpload(image!);
                            setState(() {});
                          }
                        },
                  child: image ==
                          null // if no image selected then show add icon and text
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.add_rounded,
                              color: AppColors.primary,
                            ),
                            const SizedBox(height: CustomSizes.spaceBtwItems),
                            Text(
                              "Add Article Image",
                              style: TextStyles.regular14
                                  .copyWith(color: Colors.grey),
                            ),
                          ],
                        )
                      : Image.file(image!, fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          if (image != null) // show this if only image not null
            Positioned(
              right: 10,
              bottom: 10,
              child: CustomCircularContainer(
                onTap: () {
                  setState(() {
                    // remove picked image
                    image = null;
                  });
                },
                color: Colors.white,
                child: const Icon(
                  Icons.cancel_rounded,
                  color: Colors.red,
                  size: 20,
                ),
              ),
            )
        ],
      ),
    );
  }
}
