class ReactionModel {
  final int id;
  final String type;
  final int userId;
  final int postId;
  final DateTime createdAt;
  final DateTime updatedAt;

  ReactionModel({
    required this.id,
    required this.type,
    required this.userId,
    required this.postId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ReactionModel.fromJson(Map<String, dynamic> json) => ReactionModel(
        id: json["id"],
        type: json["type"],
        userId: json["user_id"],
        postId: json["post_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "user_id": userId,
        "post_id": postId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}