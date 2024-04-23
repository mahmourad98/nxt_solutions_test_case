import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nxt_test_case/config/app_configs.dart';
import 'package:nxt_test_case/config/supported_languages.dart';
import 'package:nxt_test_case/core/extras/services/app-localization-service/app_localization_delegate.dart';
import 'package:nxt_test_case/core/extras/services/app-localization-service/app_localization_service.dart';
import 'package:nxt_test_case/core/extras/services/app-navigation-service/app_navigation_service.dart';
import 'package:nxt_test_case/core/extras/services/app-navigation-service/app_route_names.dart';
import 'package:nxt_test_case/core/extras/services/app-navigation-service/app_router.dart';
import 'package:nxt_test_case/core/layers/presentation/pages/reservations-list-page/reservation_list_page_view.dart';
import 'package:nxt_test_case/out-buildings/dependency_injector.dart';

class MyApplication extends StatelessWidget {
  static const _key = ValueKey("my-app",);
  static const _app = MyApplication._(key: _key,);
  const MyApplication._({super.key,});
  factory MyApplication() => _app;
  @override Widget build(BuildContext context,) {
    if(Platform.isAndroid) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConfigs.APP_NAME,
        //TODO: Add theme
        /*theme: AppTheme.isDarkTheme ? AppTheme.appThemeDark : AppTheme.appThemeLight,
        themeMode: AppTheme.isDarkTheme ? ThemeMode.dark : ThemeMode.light,*/
        builder: (BuildContext buildContext, Widget? childWidget,) {
          _setDeviceOrientation();
          return Theme(
            data: ThemeData(fontFamily: _fontFamily,),
            child: childWidget!,
          );
        },
        navigatorKey: serviceLocator<AppNavigationService>().navKey,
        navigatorObservers: _navigationObservers,
        initialRoute: ReservationsListPageView.routeName,
        onGenerateInitialRoutes: (_,) => [AppRouter.onGenerateRoute(RouteSettings(name: _,),)!,],
        routes: const <String, WidgetBuilder>{},
        onGenerateRoute: AppRouter.onGenerateRoute,
        onUnknownRoute: AppRouter.onGenerateRoute,
        locale: serviceLocator<AppLocalizationService>().currentLocale,
        supportedLocales: _supportedLanguages,
        localizationsDelegates: _localizationDelegates,
        localeResolutionCallback: _localeResolutionCallback,
      );
    }
    else {
      return CupertinoApp(
        debugShowCheckedModeBanner: false,
        title: AppConfigs.APP_NAME,
        builder: (BuildContext buildContext, Widget? childWidget,) {
          _setDeviceOrientation();
          return Theme(
            data: ThemeData(fontFamily: _fontFamily,),
            child: childWidget!,
          );
        },
        navigatorKey: serviceLocator<AppNavigationService>().navKey,
        navigatorObservers: _navigationObservers,
        initialRoute: Navigator.defaultRouteName,
        onGenerateInitialRoutes: (String _,) => [AppRouter.onGenerateRoute(RouteSettings(name: _,),)!,],
        routes: const <String, WidgetBuilder>{},
        onGenerateRoute: AppRouter.onGenerateRoute,
        onUnknownRoute: AppRouter.onGenerateRoute,
        locale: serviceLocator<AppLocalizationService>().currentLocale,
        supportedLocales: _supportedLanguages,
        localizationsDelegates: _localizationDelegates,
        localeResolutionCallback: _localeResolutionCallback,
      );
    }
  }

  void _setDeviceOrientation() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,],);
  }

  List<NavigatorObserver> get _navigationObservers => [
    serviceLocator<AppNavigationService>().navObserver,
  ];

  String get _fontFamily => serviceLocator<AppLocalizationService>().isRTL ? "Cairo" : "Poppins";

  List<Locale> get _supportedLanguages => List<Locale>.generate(
    SupportedLanguage.languageNames.length,
    (int index,) => Locale(SupportedLanguage.languageCodes[index], SupportedLanguage.countryCodes[index],),
  );

  List<LocalizationsDelegate> get _localizationDelegates => const <LocalizationsDelegate<dynamic>>[
    AppLocalizationDelegate.instance,
    GlobalWidgetsLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  Locale? _localeResolutionCallback(Locale? locale, Iterable<Locale> supportedLocales,) {
    if(locale != null && locale.languageCode.isNotEmpty) {
      final int langId = SupportedLanguage.getLanguageIndex(locale.languageCode,);
      final int langIndex = (langId == -1) ? 0 : langId;
      return Locale(
        SupportedLanguage.languageCodes[langIndex],
        SupportedLanguage.countryCodes[langIndex],
      );
    }
    else {
      return supportedLocales.first;
    }
  }
}
