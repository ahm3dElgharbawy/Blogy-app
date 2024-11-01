import 'package:blog_app/core/constants/images_strings.dart';
import 'package:blog_app/features/article/data/models/category.dart';
import 'package:blog_app/features/auth/data/models/user.dart';
import 'package:blog_app/features/home/data/models/reaction.dart';

class ArticleModel {
  int id;
  String title;
  String body;
  String? image;
  int userId;
  int categoryId;
  DateTime createdAt;
  DateTime updatedAt;
  int commentsCount;
  int likeCount;
  int loveCount;
  int hahaCount;
  ReactionModel? myReaction;
  User user;
  CategoryModel category;

  ArticleModel({
    required this.id,
    required this.title,
    required this.body,
    required this.image,
    required this.userId,
    required this.categoryId,
    required this.createdAt,
    required this.updatedAt,
    required this.commentsCount,
    required this.likeCount,
    required this.loveCount,
    required this.hahaCount,
    required this.myReaction,
    required this.user,
    required this.category,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        image: json["image"],
        userId: json["user_id"],
        categoryId: json["category_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        commentsCount: json["comments_count"],
        likeCount: json["like_count"],
        loveCount: json["love_count"],
        hahaCount: json["haha_count"],
        myReaction: json["user_reaction"] == null
            ? null
            : ReactionModel.fromJson(json["user_reaction"]),
        user: User.fromJson(json["user"]),
        category: CategoryModel.fromJson(json["category"]),
      );

  void updateFromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    body = json["body"];
    image = json["image"];
    userId = json["user_id"];
    categoryId = json["category_id"];
    createdAt = DateTime.parse(json["created_at"]);
    updatedAt = DateTime.parse(json["updated_at"]);
    commentsCount = json["comments_count"];
    likeCount = json["like_count"];
    loveCount = json["love_count"];
    hahaCount = json["haha_count"];
    myReaction = json["user_reaction"] == null
        ? null
        : ReactionModel.fromJson(json["user_reaction"]);
    user = User.fromJson(json["user"]);
    category = CategoryModel.fromJson(json["category"]);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "image": image,
        "user_id": userId,
        "category_id": categoryId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "comments_count": commentsCount,
        "like_count": likeCount,
        "love_count": loveCount,
        "haha_count": hahaCount,
        "user_reaction": myReaction?.toJson(),
        "user": user.toJson(),
        "category": category.toJson(),
      };

  int get reactionsCount {
    return likeCount + loveCount + hahaCount;
  }

  int get reactionsTypesCount {
    int count = 0;
    if (likeCount != 0) {
      count++;
    }
    if (loveCount != 0) {
      count++;
    }
    if (hahaCount != 0) {
      count++;
    }
    return count;
  }

  // removeReaction() {
  //   switch (myReaction!.type) {
  //     case "haha":
  //       hahaCount -= 1;
  //       return;
  //     case "love":
  //       loveCount -= 1;
  //       return;
  //     case "like":
  //       likeCount -= 1;
  //       return;
  //   }
  //   myReaction = null;
  // }

  // addReaction() {
  //   switch (myReaction!.type) {
  //     case "haha":
  //       hahaCount += 1;
  //       return;
  //     case "love":
  //       loveCount += 1;
  //       return;
  //     case "like":
  //       likeCount += 1;
  //       return;
  //   }
  // }

  List<String> get reactionsImages {
    List<String> reactions = [];
    if (likeCount != 0) {
      reactions.add(ImagesStrings.like);
    }
    if (loveCount != 0) {
      reactions.add(ImagesStrings.love);
    }
    if (hahaCount != 0) {
      reactions.add(ImagesStrings.haha);
    }
    return reactions;
  }
}
