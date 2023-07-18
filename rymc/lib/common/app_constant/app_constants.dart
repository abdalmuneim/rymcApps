class AppConstants {
  static List<LanguageModel> languages = [
    LanguageModel(
        imageUrl: 'en.png',
        languageName: "English",
        countryCode: "US",
        languageCode: "en"),
    LanguageModel(
        imageUrl: 'ar.png',
        languageName: "العربية",
        countryCode: "eg",
        languageCode: "ar"),
  ];

  static int timeOut = 60;
  static String countryCode = "+966";

  static int phoneLength = 10;
  static int codeLength = 6;
}

class LanguageModel {
  final String imageUrl;
  final String languageName;
  final String countryCode;
  final String languageCode;

  LanguageModel({
    required this.imageUrl,
    required this.languageName,
    required this.countryCode,
    required this.languageCode,
  });
}
