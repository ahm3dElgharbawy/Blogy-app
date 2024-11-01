import 'package:blog_app/core/constants/enums.dart';
import 'package:blog_app/core/constants/images_strings.dart';
import 'package:blog_app/features/article/data/models/emoji.dart';
import 'package:flutter/material.dart';

class ReactionsData {
  static List<Emoji?> get get => [
        Emoji(
          title: ReactionType.haha.name,
          image: ImagesStrings.haha,
          icon: const Icon(
            Icons.emoji_emotions_rounded,
            color: Colors.orange,
          ),
        ),
        Emoji(
          title: ReactionType.love.name,
          image: ImagesStrings.love,
          icon: const Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        ),
        Emoji(
          title: ReactionType.like.name,
          image: ImagesStrings.like,
          isLike: true,
          icon: const Icon(
            Icons.thumb_up,
            color: Colors.blue,
          ),
        ),
      ];
}
