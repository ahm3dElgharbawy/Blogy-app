import 'package:flutter/widgets.dart';
import 'package:blog_app/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomGridViewWidget extends StatelessWidget {
  const CustomGridViewWidget({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    this.physics,
    this.scrollDirection = Axis.vertical,
    this.mainAxisExtent = 234,
    this.padding = const EdgeInsets.all(CustomSizes.defaultSpace),
    this.shrinkWrap = true, this.scrollController
  });
  final Widget? Function(BuildContext, int) itemBuilder;
  final int itemCount;
  final ScrollPhysics? physics;
  final Axis scrollDirection ;
  final double mainAxisExtent;
  final EdgeInsetsGeometry padding;
  final bool shrinkWrap;
  final ScrollController? scrollController;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: scrollController,
      itemCount: itemCount,
      shrinkWrap: shrinkWrap,
      physics: physics,
      scrollDirection: scrollDirection ,
      padding: padding,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: mainAxisExtent,
        mainAxisSpacing: CustomSizes.md,
        crossAxisSpacing: CustomSizes.sm,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
