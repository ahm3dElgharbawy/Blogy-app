import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:blog_app/core/constants/endpoints.dart';
import 'package:blog_app/localization/app_localizations.dart';

extension StringAsToast on String {
  showAsToast(Color color, {ToastGravity gravity = ToastGravity.TOP}) {
    Fluttertoast.showToast(
      msg: this,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}

extension OnlineImage on String {
  String get imageUrl => "${EndPoints.baseUrl.split("/api")[0]}/public/$this";
}

extension LocalizationShortCut on String {
  String get tr {
    return AppLocalizations.instance.translate(this) ?? this;
  }
}

extension TimeAgo on DateTime {
  String get inAgo {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds}s ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    }
    return toString();
  }
}
