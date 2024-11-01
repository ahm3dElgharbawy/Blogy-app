import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  final int id;
  final String name;
  final String? email;
  final String? phone;
  final String image;
  final bool? isLocked;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.isLocked,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        image: json["image"],
        isLocked: json["is_locked"] == 0 ? false : true,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "image": image,
        "is_locked": isLocked == false ? 0 : 1,
      };
}
