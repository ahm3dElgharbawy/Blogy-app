import 'dart:math';

import 'package:blog_app/core/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        // height: 200,
        // width: 500,
        child: Center(
          child: Container(
            height: min(size.height, size.width) * .5,
            width: min(size.height, size.width) * .5,
            color: Colors.grey[300],
            child: LayoutBuilder(
              builder: (context, cons) => Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: cons.maxWidth * .5,
                      height: cons.maxHeight * .5,
                      color: Colors.red,
                      child: Text(
                        "${context.screenWidth}h",
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      width: cons.maxWidth * .5,
                      height: cons.maxHeight * .5,
                      color: Colors.black,
                      child: Text(
                        "${context.screenHeight}h",
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
