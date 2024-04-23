import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:nxt_test_case/core/extras/services/app-localization-service/app_localization_service.dart';
import 'package:nxt_test_case/core/extras/services/app-network-service/dio_network_service.dart';
import 'package:nxt_test_case/main.dart';
import 'package:nxt_test_case/out-buildings/dependency_injector.dart';

mixin RemoteDataSourceHelper {
  static const headers = <String, dynamic>{
    HttpHeaders.acceptHeader: "text/plain",
    HttpHeaders.contentTypeHeader: "application/json",
  };

  DioNetworkService get networkService => serviceLocator<DioNetworkService>();
  AppLocalizationService get localizationService => serviceLocator<AppLocalizationService>();

  @protected Future<Map<String, dynamic>> getHttpRequestHeaders({
    bool needAuth = false, bool addLocale = false,
  }) async {
    return {
      ...headers,
      if(addLocale) HttpHeaders.acceptLanguageHeader: localizationService.currentLocale.languageCode,
      if(needAuth) HttpHeaders.authorizationHeader: "Bearer $apiAccessToken",
    };
  }

  String getProperUrl({required String url, Map? params, String? stringParams,}) {
    final urlBuffer = StringBuffer()..write(url,);
    ///Params object
    final allParams = {
      if (params != null) ...params,
    };
    if (allParams.isNotEmpty) {
      urlBuffer.write("?${allParams.toString().replaceAll(", ", "&",).replaceAll(": ", "=",).replaceAll("{", "",).replaceAll("}", "",)}",);
    }
    if (stringParams != null) {
      urlBuffer.write(stringParams,);
    }
    final finalUrl = urlBuffer.toString();
    return finalUrl;
  }
}