class CategoryModel {
  final int id;
  final String nameAr;
  final String nameEn;
  final String color;

  CategoryModel({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.color,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        nameAr: json["name_ar"],
        nameEn: json["name_en"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_ar": nameAr,
        "name_en": nameEn,
        "color": color,
      };
}
