import 'package:blog_app/core/common/widgets/buttons/material_button.dart';
import 'package:blog_app/core/constants/app_colors.dart';
import 'package:blog_app/features/article/data/local_data/reactions.dart';
import 'package:blog_app/features/article/data/models/emoji.dart';
import 'package:blog_app/features/article/logic/reaction_cubit/reaction_cubit.dart';
import 'package:blog_app/features/article/screens/show/widgets/reaction_button/custom_reactions_popup.dart';
import 'package:blog_app/features/home/data/models/article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReactionButton extends StatefulWidget {
  const ReactionButton({super.key, required this.article});
  final ArticleModel article;

  @override
  State<ReactionButton> createState() => _ReactionButtonState();
}

class _ReactionButtonState extends State<ReactionButton> {
  OverlayEntry? _overlayEntry;
  Emoji? _selectedReaction;

  @override
  void initState() {
    super.initState();
    _selectedReaction = ReactionsData.get.firstWhere(
      (emoji) => emoji!.title == widget.article.myReaction?.type,
      orElse: () => null,
    );
  }

  void showOverlay(BuildContext context, Offset tapPosition) {
    _overlayEntry = OverlayEntry(
      builder: (context) => CustomReactionsPopup(
        onTapOutSide: () => hideOverlay(),
        onReact: (value) {
          ReactionCubit.get(context).addReaction(widget.article, value!);
          _selectedReaction = value;
          setState(() {});
          hideOverlay();
        },
        tapPosition: tapPosition,
      ),
    );
    Overlay.of(context)
        .insert(_overlayEntry!); // display the popup on the screen
  }

  hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onLongPressStart: (details) {
            if (_overlayEntry == null) {
              showOverlay(context, details.globalPosition);
            } else {
              hideOverlay();
            }
          },
          child: BlocBuilder<ReactionCubit, ReactionState>(
            builder: (context, state) {
              return CustomMaterialButton(
                onTap: () {
                  if (_selectedReaction == null) {
                    ReactionCubit.get(context)
                        .addReaction(widget.article, ReactionsData.get.last!);
                    _selectedReaction = ReactionsData.get.last;
                  } else {
                    ReactionCubit.get(context).removeReaction(widget.article);
                    _selectedReaction = null;
                  }
                },
                child: _selectedReaction == null
                    ? const Icon(Icons.thumb_up_alt_outlined)
                    : _selectedReaction!.isLike
                        ? const Icon(Icons.thumb_up, color: AppColors.primary)
                        : Image.asset(
                            _selectedReaction!.image,
                            height: 24,
                          ),
              );
            },
          ),
        ),
      ],
    );
  }
}
