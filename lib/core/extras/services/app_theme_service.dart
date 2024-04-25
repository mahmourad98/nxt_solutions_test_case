import 'package:flutter/material.dart';
import 'package:nxt_test_case/out-buildings/dependency_injector.dart';
class AppThemeService extends ThemeExtension<AppThemeService> implements ThemeInterface {
  final _listeners = <void Function()>[];
  final _currentThemeNotifier = ValueNotifier<ThemeMode?>(null,);
  ValueNotifier<ThemeMode?> get currentThemeNotifier => _currentThemeNotifier;
  ThemeMode get currentThemeMode => _currentThemeNotifier.value ?? ThemeMode.system;
  bool get isDark => _currentThemeNotifier.value == ThemeMode.dark;
  @override ThemeData get currentTheme {
    return _currentThemeNotifier.value != ThemeMode.dark ? lightTheme : darkTheme;
  }
  @override void setCurrentTheme(ThemeMode themeMode,) {
    _currentThemeNotifier.value = themeMode;
    _currentThemeNotifier.notifyListeners();
  }
  @override ThemeData get darkTheme => ThemeData(brightness: Brightness.dark,);
  @override ThemeData get lightTheme => ThemeData(brightness: Brightness.light,);
  @override ThemeExtension<AppThemeService> copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }
  @override ThemeExtension<AppThemeService> lerp(covariant ThemeExtension<ThemeExtension>? other, double t) {
    // TODO: implement lerp
    throw UnimplementedError();
  }
  void addNewListener(void Function() listener,) {
    _listeners.add(listener,);
    return _currentThemeNotifier.addListener(listener,);
  }
  void removeAllListeners() {
    for (final listener in _listeners) {
      _currentThemeNotifier.removeListener(listener,);
    }
    return _listeners.clear();
  }
}

abstract class ThemeInterface {
  ThemeData get currentTheme;
  void setCurrentTheme(ThemeMode themeMode,);
  ThemeData get darkTheme;
  ThemeData get lightTheme;

}