class SupportedLanguage {
  const SupportedLanguage._();
  /////////////////////////
  static const List<String> languageNames = ['English',];
  static const List<String> languageCodes = ['en',];
  static const List<String> countryCodes = ['US',];
  static int getLanguageIndex(String languageCode,) {
    return languageCodes.indexOf(languageCode,);
  }
}