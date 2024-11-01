import 'package:flutter/material.dart';

class Emoji {
  final String title;
  final String image;
  final Icon icon;
  final bool isLike;
  const Emoji({
    required this.image,
    required this.icon,
    required this.title,
    this.isLike = false,
  });
}
