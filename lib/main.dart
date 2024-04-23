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

const String apiAccessToken = "eyJhbGciOiJSUzI1NiJ9.eyJpZCI6MzAzLCJ0eXBlIjoidXNlciIsInJhbiI6IkJORU5WSVBOTlFUWVBMS0tVQ0JWIiwic3RhdHVzIjoxfQ.YGV-jGKZj1Lp4SqlM3aiF6Aov6YVF6lZRMpKvx_Zdrpjj4C1zE-JSTKtjVboQ9de58TUViyVOc4JwiktjF_4yxnYzIrw449s584j2GiqUpxfp6OPmfAj8BAbfN_M4RoU5PXEjhcNVh5uNRtxtvxZtpECrl72_22T4he3LbqISMNHzVh5eprIKIFLt_pM7cyRKt3Njf8I89CLnq5nUpiDHnMMForamKq9jubmiYPOHpFvijEE3-jusRk0F1T32zMY_0AELXnpqhbbx6HtmMdxBahnrUNyznacdVwaSrNus8vX01N8zEcfRvkRzYuqjnZXr9jrm2iriHq80iicUG99GQ";
