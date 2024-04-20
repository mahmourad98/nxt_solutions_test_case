import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpdart/fpdart.dart';
import 'package:intl/intl.dart' as intl;
import 'package:nxt_test_case/config/shared_prefs_keys.dart';
import 'package:nxt_test_case/config/supported_languages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLocalizationService extends ChangeNotifier{
  Locale? _locale;
  Locale get currentLocale => _locale!;
  /////////////////////////////
  Map<String, String>? _localizedStrings;
  Map<String, String> get localizedStrings => _localizedStrings!;
  /////////////////////////////
  int get currentLangIndex => SupportedLanguage.getLanguageIndex(currentLocale.languageCode,);
  bool get isRTL => intl.Bidi.isRtlLanguage(currentLocale.languageCode,);

  ///DEFAULT CONSTRUCTOR
  AppLocalizationService() {
    _locale ??= Locale(SupportedLanguage.languageCodes.first, SupportedLanguage.countryCodes.first,);
    _localizedStrings ??= <String, String>{};
  }

  Future<void> initAppLocaleFromDB() async {
    ///GET CURRENT APP LOCAL FROM DB
    final langCode = await _getLanguageId();
    ///GET THE STORED RESOURCE
    final newLocale = Locale(SupportedLanguage.languageCodes[langCode], SupportedLanguage.countryCodes[langCode],);
    _locale = newLocale; await _loadLocalizedText(newLocale,);
    return /*notifyListeners()*/;
  }

  Future<void> setAppLocale(int langCode,) async {
    if(langCode >= SupportedLanguage.languageCodes.length) throw Exception('Language code is not valid',);
    ///UPDATE LOCALE
    await _setLanguageId(langCode,);
    ///SAVE LOCAL
    final newLocale = Locale(SupportedLanguage.languageCodes[langCode], SupportedLanguage.countryCodes[langCode],);
    _locale = newLocale; await _loadLocalizedText(newLocale,);
    return notifyListeners();
  }

  ///LOAD THE LANGUAGE JSON FILE FROM THE "lang" FOLDER IN ASSETS
  Future<bool> _loadLocalizedText(Locale locale,) async {
    try {
      _localizedStrings?.clear();
      String jsonString = await rootBundle.loadString('assets/lang/${locale.languageCode}_${locale.countryCode?.toUpperCase()}.json',);
      Map<String, dynamic> jsonMap = json.decode(jsonString,);
      _localizedStrings?.addAll(jsonMap.map((String key, dynamic value,) => MapEntry(key, value.toString(),),),);
      return true;
    }
    catch(e) { return false; }
  }

  ///READ LOCALIZED TEXT VALUE
  String getLocalizedValue(String key,) {
    return _localizedStrings?[key] ?? key;
  }

  ///GET LANGUAGE CODE FROM DB
  Future<int> _getLanguageId() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final langCode = sharedPrefs.getInt(SharedPrefsKeys.LANGUAGE_ID,) ?? 0;
    return langCode;
  }

  ///SET LANGUAGE CODE AT DB
  Future<bool> _setLanguageId(int langId,) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    return await Future.wait([
      sharedPrefs.setInt(SharedPrefsKeys.LANGUAGE_ID, langId,),
      sharedPrefs.setString(SharedPrefsKeys.LANGUAGE_CODE, SupportedLanguage.languageCodes[langId],),
      sharedPrefs.setString(SharedPrefsKeys.COUNTRY_CODE, SupportedLanguage.countryCodes[langId],),
    ]).then(
      (List<bool> results) => results.all((bool e,) => e,),
    ).catchError((_,) => false,);
  }
}