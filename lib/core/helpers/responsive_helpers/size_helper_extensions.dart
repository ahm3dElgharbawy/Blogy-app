import 'dart:math';

import 'package:blog_app/core/helpers/navigation/navigation_helper.dart';
import 'package:blog_app/core/helpers/responsive_helpers/size_provider.dart';
import 'package:flutter/material.dart';

extension SizeHelperExtensions on BuildContext {
  bool get isLandscape => MediaQuery.of(this).orientation == Orientation.landscape;

  double get screenWidth => isLandscape
      ? MediaQuery.of(this).size.height
      : MediaQuery.of(this).size.width;

  double get screenHeight => isLandscape
      ? MediaQuery.of(this).size.width
      : MediaQuery.of(this).size.height;

  SizedProvider get sizeProvider => SizedProvider.of(this);

  double get scaleWidth => sizeProvider.width / sizeProvider.designSize.width;
  double get scaleHeight => sizeProvider.height / sizeProvider.designSize.height;

  double setWidth(num w) => w * scaleWidth;
  double setHeight(num h) => h * scaleHeight;
  double setSp(num fontSize) => fontSize * scaleWidth;
  double setMinSize(num size) => size * min(scaleHeight, scaleWidth);
}


extension ResponsiveSize on num {
  double get h => NavigationHelper.navigatorKey.currentContext?.setHeight(this) ?? toDouble();
  double get w => NavigationHelper.navigatorKey.currentContext?.setWidth(this) ??  toDouble();
  double get sp => NavigationHelper.navigatorKey.currentContext?.setSp(this) ??  toDouble();
}
