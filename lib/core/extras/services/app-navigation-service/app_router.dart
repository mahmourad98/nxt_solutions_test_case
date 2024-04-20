import 'package:flutter/material.dart';

class AppRouter{
  const AppRouter._();
  static Route? onGenerateRoute(RouteSettings routeSettings,){
    if(routeSettings.name == Navigator.defaultRouteName) return null;
    switch (routeSettings.name){
      default:
      return MaterialPageRoute(
        builder: (_,) {
          return Scaffold(body: SizedBox.expand(child: ErrorWidget("unknown-route",),),);
        },
        settings: routeSettings,
      );
    }
  }
}
