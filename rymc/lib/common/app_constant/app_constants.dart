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

  static int timeOut = 30;
  static int timeOutWaitDoctor = 60;
  static int timeOutThank = 5;

  static int phoneLength = 9;
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
