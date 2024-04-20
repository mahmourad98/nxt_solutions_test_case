import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:nxt_test_case/core/extras/services/app-localization-service/app_localization_service.dart';
import 'package:nxt_test_case/out-buildings/dependency_injector.dart';
import 'dio_network_response_type.dart';
import '../../helpers/global_network_service_helper.dart';

class GeneralRequestAndResponseInterceptor extends Interceptor {
  final Dio dio;
  /////////////////////////
  GeneralRequestAndResponseInterceptor({required this.dio,});
  /////////////////////////
  static int _retryCount = 0;
  static const _retryDelay = 500;
  static const int _maxRetryCount = 5;
  /////////////////////////
  static final _error500List = [
    HttpStatus.internalServerError,
    HttpStatus.notImplemented,
    HttpStatus.badGateway,
    HttpStatus.serviceUnavailable,
    HttpStatus.gatewayTimeout,
    HttpStatus.httpVersionNotSupported,
  ];
  /////////////////////////
  @override void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    //TODO: Add token
    const String? token = null;
    final local = serviceLocator<AppLocalizationService>().currentLocale;
    options.headers["Accept-Language"] = local.languageCode;
    options.headers["Accept"] = "application/json";
    if (token != null && token.isNotEmpty) {
      options.headers["Authorization"] = "Bearer $token";
    }
    return handler.next(options,);
  }
  /////////////////////////
  @override void onResponse(Response<Object?> response, ResponseInterceptorHandler handler,) async{
    if (_error500List.contains(response.statusCode,)) {
      response.data = {
        'code': response.statusCode,
        'status': false,
        'message': serviceLocator<AppLocalizationService>().getLocalizedValue(NetworkResponseType.serverError.messageKey,),
      };
      return handler.next(response,);
    } else if (response.statusCode == HttpStatus.tooManyRequests) {
      if(_retryCount < _maxRetryCount) {
        _retryCount++;
        final retryResponse = await Future.delayed(
          Duration(milliseconds: _retryDelay * (2 ^ _retryCount)),
          () => retryRequest(dio, response.requestOptions,),
        );
        _retryCount = 0;
        return handler.resolve(retryResponse,);
      } else {
        response.data = {
          'code': response.statusCode,
          'status': false,
          'message': serviceLocator<AppLocalizationService>().getLocalizedValue(NetworkResponseType.clientError.messageKey,),
        };
        return handler.next(response,);
      }
    }
    return super.onResponse(response, handler,);
  }
  /////////////////////////
  @override void onError(DioException err, ErrorInterceptorHandler handler,) {
    if (err.error is IOException || err.error is SocketException || err.error is WebSocketException) {
      return handler.reject(
        DioException(requestOptions: err.requestOptions, response: err.response, error: err, type: DioExceptionType.connectionError,),
      );
    } else if (err.error is HttpException || err.error is HandshakeException) {
      return handler.reject(
        DioException(requestOptions: err.requestOptions, response: err.response, error: err, type: DioExceptionType.badCertificate,),
      );
    } else if (err.error is TimeoutException) {
      return handler.reject(
        DioException(requestOptions: err.requestOptions, response: err.response, error: err, type: DioExceptionType.connectionTimeout,),
      );
    }
    return handler.next(err,);
  }
}