import 'dart:io';
import 'package:flutter/material.dart';
import 'app/app_entry_point.dart';
import 'out-buildings/dependency_injector.dart';
import 'out-buildings/app_logger.dart';

///HTTP OVERRIDES
class MyHttpOverrides extends HttpOverrides {
  @override HttpClient createHttpClient(SecurityContext? context,) {
    return super.createHttpClient(context,)..badCertificateCallback = (X509Certificate cert, String host, int port,) => true;
  }
}

void main() async {
  getLogger(className: "mainMethod()",).i("main method was called.",);
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await _appEntryMethod();
  runApp(const AppEntryPoint(),);
  getLogger(className: "mainMethod()",).i("app has run successfully.",);
}

Future _appEntryMethod() async {
  try {
    await setupServiceLocator();
    getLogger(className: "appEntryMethod()",).i("pre-run dependency were successfully initialized.",);
  } on Exception catch (e) {
    getLogger(className: "_appEntryMethod()",).e(e,);
    exit(1,);
  }
}
