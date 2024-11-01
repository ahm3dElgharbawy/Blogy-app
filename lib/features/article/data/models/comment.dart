import 'package:blog_app/features/auth/data/models/user.dart';

class CommentModel {
  final int id;
  final String comment;
  final int userId;
  final int postId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User user;

  CommentModel({
    required this.id,
    required this.comment,
    required this.userId,
    required this.postId,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        id: json["id"],
        comment: json["comment"],
        userId: json["user_id"],
        postId: json["post_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "comment": comment,
        "user_id": userId,
        "post_id": postId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user.toJson(),
      };
}
