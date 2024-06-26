import 'package:flutter/material.dart';

class AppNavigationService{
  ///DEFAULT CONSTRUCTOR
  AppNavigationService();

  final GlobalKey<NavigatorState> _navKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get navKey => _navKey;

  final NavigatorObserver _navObserver = NavigatorObserver();
  NavigatorObserver get navObserver => _navObserver;

  void goBack<T>([T? results,]) {
    return _navKey.currentState!.pop<T>(results,);
  }

  void goBackUntil({String? tillRouteName,}) {
    return _navKey.currentState!.popUntil(
      (Route r,) => (tillRouteName == null) ? false : (r.settings.name == tillRouteName),
    );
  }

  Future<T?> navigateTo<T, S>({required String routeName, S? arguments,}) async {
    return await _navKey.currentState!.pushNamed<T>(routeName, arguments: arguments,);
  }

  Future<T?> clearStackAndShow<T, S>({
    required String routeName, String? tillRouteName, S? arguments,
  }) async {
    return await _navKey.currentState!.pushNamedAndRemoveUntil<T>(
      routeName,
      (Route r,) => (tillRouteName == null) ? false : (r.settings.name == tillRouteName),
      arguments: arguments,
    );
  }

  Future<T?> replaceWith<T, S>({required String routeName, S? arguments,}) async {
    return await _navKey.currentState!.pushReplacementNamed<T, dynamic>(routeName, arguments: arguments, result: null,);
  }

  Future<T?> removeAndReplaceWith<T, S>({required String routeName, S? arguments, dynamic results,}) async {
    return await _navKey.currentState!.popAndPushNamed<T, dynamic>(routeName, arguments: arguments, result: results,);
  }

  Future<T?> pushDialog<T>({
    RouteSettings? settings, required WidgetBuilder widgetBuilder,
    String? label, bool isDismissible = false, Color color = Colors.transparent,
  }) async{
    return await showDialog<T>(
      context: _navKey.currentContext!,
      routeSettings: settings,
      builder: widgetBuilder,
      barrierLabel: label,
      barrierColor: color,
      barrierDismissible: isDismissible,
    );
  }

  Future<T?> pushBottomSheet<T>({
    RouteSettings? settings, required WidgetBuilder widgetBuilder, AnimationController? animationController,
    String? label, bool isScrollable = true, bool isDismissible = false, bool isFullPage = false,
    Color color = Colors.transparent,
  }) async{
    return await showModalBottomSheet<T>(
      context: _navKey.currentContext!,
      routeSettings: settings,
      builder: widgetBuilder,
      backgroundColor: color,
      barrierColor: color,
      isDismissible: isDismissible,
      isScrollControlled: isScrollable,
      enableDrag: true,
      useRootNavigator: true,
      useSafeArea: true,
      showDragHandle: false,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(_navKey.currentContext!,).size.height * (isFullPage ? 1.0 : 0.80),
        maxHeight: MediaQuery.of(_navKey.currentContext!,).size.height * (isFullPage ? 1.0 : 0.80),
      ),
    );
  }
}
