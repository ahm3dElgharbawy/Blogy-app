import 'package:blog_app/core/constants/images_strings.dart';
import 'package:blog_app/features/setting/data/models/language.dart';

class AppLanguages {
  static List<LanguageModel> get get => [
    const LanguageModel(langCode: "ar", language: "Arabic", countryImage: ImagesStrings.egypt),
    const LanguageModel(langCode: "en", language: "English", countryImage: ImagesStrings.america),
  ];
}