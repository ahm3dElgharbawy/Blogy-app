import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/features/article/data/local_data/reactions.dart';
import 'package:blog_app/features/article/data/models/emoji.dart';
import 'package:flutter/material.dart';

class CustomReactionsPopup extends StatefulWidget {
  const CustomReactionsPopup(
      {super.key, required this.onTapOutSide, required this.onReact, required this.tapPosition});
  final VoidCallback onTapOutSide;
  final ValueChanged<Emoji?> onReact;
  final  Offset tapPosition;

  @override
  State<CustomReactionsPopup> createState() => _CustomReactionsPopupState();
}

class _CustomReactionsPopupState extends State<CustomReactionsPopup> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent, // on tap outside the overlay
      onTap: widget.onTapOutSide,
      child: Stack(
        children: [
          Positioned(
            top: widget.tapPosition.dy - 100,
            right: CustomSizes.defaultSpace,
            child: SizedBox(
              height: 60,
              child: Material(
                elevation: 4.0,
                clipBehavior: Clip.antiAlias,
                shape: const StadiumBorder(),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: ReactionsData.get
                      .map(
                        (emoji) => IconButton(
                          onPressed: () {
                            widget.onReact(emoji);
                            setState(() {});
                          },
                          icon: Image.asset(
                            emoji!.image,
                            height: 30,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
