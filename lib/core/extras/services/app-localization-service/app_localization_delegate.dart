import 'package:flutter/material.dart';
import 'package:nxt_test_case/config/supported_languages.dart';
import 'package:nxt_test_case/out-buildings/dependency_injector.dart';
import 'app_localization_service.dart';

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizationService> {
  static const instance = AppLocalizationDelegate._();
  const AppLocalizationDelegate._();
  @override bool isSupported(Locale locale,) => SupportedLanguage.languageCodes.contains(locale.languageCode,);

  @override Future<AppLocalizationService> load(Locale locale,) async => serviceLocator<AppLocalizationService>();

  @override bool shouldReload(AppLocalizationDelegate old,) => true;
}
