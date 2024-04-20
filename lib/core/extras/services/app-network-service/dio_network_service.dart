//ignore_for_file: constant_identifier_names, depend_on_referenced_packages
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:nxt_test_case/config/app_end_points.dart';
import 'package:nxt_test_case/out-buildings/app_logger.dart';
import 'package:open_file/open_file.dart' as open_file;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'dio_network_failure_type.dart';
import 'general_network_interceptor.dart';

class DioNetworkService {
  static const CLASS_NAME = "DioNetworkService";
  /////////////////////////
  static const _TIMEOUT = Duration(milliseconds: 60000,);
  /////////////////////////
  final Dio _dio;
  Dio get dio => _dio;
  ///DEFAULT CONSTRUCTOR
  DioNetworkService.create(this._dio,){
    _dio.options = _baseOptions;
    _dio.interceptors.addAll(_cacheInterceptors,);
    _dio.interceptors.addAll(_interceptors,);
  }
  ///FACTORY CONSTRUCTOR - USE ONLY WHEN YOU NEED TO CREATE A NEW INSTANCE OF THIS CLASS ON EVERY CALL
  factory DioNetworkService.insert([Dio? dio,]) {
    final obj = DioNetworkService.create(dio ?? Dio(),);
    return obj;
  }
  ///BASE OPTIONS
  final BaseOptions _baseOptions = BaseOptions(
    baseUrl: AppEndPoints.BASE_URL,
    sendTimeout: _TIMEOUT,
    connectTimeout: _TIMEOUT,
    receiveTimeout: _TIMEOUT,
    contentType: Headers.jsonContentType,
    responseType: ResponseType.json,
    listFormat: ListFormat.multiCompatible,
    preserveHeaderCase: false,
    receiveDataWhenStatusError: true,
    persistentConnection: true,
    followRedirects: true,
    validateStatus: (int? status,) => (status != null),
  );
  ///NEW DIO INSTANCE
  Dio get newDio => Dio(_baseOptions,)..interceptors.addAll([_logger,]);
  ///INTERCEPTORS
  PrettyDioLogger get _logger => PrettyDioLogger(requestBody: false, requestHeader: false, responseBody: false, responseHeader: false,);
  late final List<Interceptor> _interceptors = [
    if(kDebugMode) ...[_logger,],
    GeneralRequestAndResponseInterceptor(dio: newDio,),
  ];
  ///CACHE INTERCEPTORS
  late final List<Interceptor> _cacheInterceptors = [
    DioCacheInterceptor(
      options: CacheOptions(
        policy: CachePolicy.request, store: MemCacheStore(),
        priority: CachePriority.low, maxStale: Duration.zero,
      ),
    ),
  ];
  ///POST HTTP
  Future<Response<T>> postHttp<T extends Object>({
    required String url, Map<String, dynamic>? body, Response<Object> Function(Response<Object>)? responseConverter,
    List<Interceptor>? interceptors, Options? options, Map<String, dynamic>? queryParameters,
  }) async {
    ///ADD REQUEST INTERCEPTORS
    if (interceptors != null) _dio.interceptors.addAll(interceptors,);
    ///FIRING REQUEST
    late Response<Object> response;
    try {
      response = await _dio.post<Object>(
        url,
        data: FormData.fromMap({
          if(body != null) ...body,
        }),
        queryParameters: queryParameters,
        options: options,
        onSendProgress: null,
      );
    }
    ///NETWORK FAILURE
    catch (e) {
      getLogger(className: CLASS_NAME,).e(e,);
      return throw NetworkFailureError(type: e.failureType,);
    }
    ///RETURNING RESPONSE
    if(responseConverter != null && response.data != null) response = responseConverter(response);
    return response.clone<T>();
  }
  ///POST HTTP WITH FILE
  Future<Response<T>> multiPartPostHttp<T extends Object>({
    required String url, Map<String, dynamic>? body, Map<String, String>? filePaths, Response<Object> Function(Response<Object>)? responseConverter,
    List<Interceptor>? interceptors, Options? options, Map<String, dynamic>? queryParameters,
    void Function(int, int,)? onSendProgress,
  }) async {
    ///ADD REQUEST INTERCEPTORS
    if (interceptors != null) _dio.interceptors.addAll(interceptors,);
    ///FIRING REQUEST
    late Response<Object> response;
    try {
      final files = filePaths?.map(
        (String key, String filePath,) => MapEntry(key, MultipartFile.fromFileSync(filePath, filename: filePath.split('/',).last,),),
      );
      response = await _dio.post<Object>(
        url,
        data: FormData.fromMap({
          if(body != null) ...body,
          if(files != null) ...files,
        }),
        queryParameters: queryParameters,
        options: options,
        onSendProgress: onSendProgress,
      );
    }
    ///NETWORK FAILURE
    catch (e) {
      getLogger(className: CLASS_NAME,).e(e,);
      return throw NetworkFailureError(type: e.failureType,);
    }
    ///RETURNING RESPONSE
    if(responseConverter != null && response.data != null) response = responseConverter(response);
    return response.clone<T>();
  }
  ///PUT HTTP
  Future<Response<T>> putHttp<T extends Object>({
    required String url, Map<String, dynamic>? body, Response<Object> Function(Response<Object>)? responseConverter,
    List<Interceptor>? interceptors, Options? options, Map<String, dynamic>? queryParameters,
  }) async {
    ///ADD REQUEST INTERCEPTORS
    if (interceptors != null) _dio.interceptors.addAll(interceptors,);
    ///FIRING REQUEST
    late Response<Object> response;
    try {
      response = await _dio.put<Object>(
        url,
        data: FormData.fromMap({
          if(body != null) ...body,
        }),
        queryParameters: queryParameters,
        options: options,
        onSendProgress: null,
      );
    }
    ///NETWORK FAILURE
    catch (e) {
      getLogger(className: CLASS_NAME,).e(e,);
      return throw NetworkFailureError(type: e.failureType,);
    }
    ///RETURNING RESPONSE
    if(responseConverter != null && response.data != null) response = responseConverter(response);
    return response.clone<T>();
  }
  ///GET HTTP
  Future<Response<T>> getHttp<T extends Object>({
    required String url, Response<Object> Function(Response<Object>)? responseConverter,
    List<Interceptor>? interceptors, Options? options,  Map<String, dynamic>? queryParameters,
  }) async{
    ///ADD REQUEST INTERCEPTORS
    if (interceptors != null) _dio.interceptors.addAll(interceptors,);
    ///FIRING REQUEST
    late Response<Object> response;
    try {
      response = await _dio.get<Object>(
        url,
        options: options,
        queryParameters: queryParameters,
      );
    }
    ///NETWORK FAILURE
    catch (e) {
      getLogger(className: CLASS_NAME,).e(e,);
      return throw NetworkFailureError(type: e.failureType,);
    }
    ///RETURNING RESPONSE
    if(responseConverter != null && response.data != null) response = responseConverter(response);
    return response.clone<T>();
  }
  ///DELETE HTTP
  Future<Response<T>> deleteHttp<T extends Object>({
    required String url, Map<String, dynamic>? body, Response<Object> Function(Response<Object>)? responseConverter,
    List<Interceptor>? interceptors, Options? options,  Map<String, dynamic>? queryParameters,
  }) async {
    ///ADD REQUEST INTERCEPTORS
    if (interceptors != null) _dio.interceptors.addAll(interceptors,);
    ///FIRING REQUEST
    late Response<Object> response;
    try {
      response = await _dio.delete<Object>(
        url,
        data: FormData.fromMap({
          if(body != null) ...body,
        }),
        options: options,
        queryParameters: queryParameters,
      );
    }
    ///NETWORK FAILURE
    catch (e) {
      getLogger(className: CLASS_NAME,).e(e,);
      return throw NetworkFailureError(type: e.failureType,);
    }
    ///RETURNING RESPONSE
    if(responseConverter != null && response.data != null) response = responseConverter(response);
    return response.clone<T>();
  }
  ///DOWNLOAD FILE
  Future<bool> downloadFile({
    required String url, required String fileName,
    List<Interceptor>? interceptors, Options? options,  Map<String, dynamic>? queryParameters,
    void Function(int, int,)? onReceiveProgress,
  }) async {
    ///ADDING INTERCEPTORS
    if (interceptors != null) _dio.interceptors.addAll(interceptors,);
    try {
      ///GETTING DOWNLOAD DIRECTORY + FILE INFO
      final dir = await path_provider.getApplicationDocumentsDirectory();
      final downloadDir = await Directory('${dir.path}/downloads',).create(recursive: true,);
      final newFileName = fileName.replaceAll(" ", "-",);
      final fileExtension = path.extension(url,);
      final fileInfo = "${downloadDir.path}/$newFileName$fileExtension";
      ///FIRING REQUEST
      await _dio.download(
        url,
        fileInfo,
        queryParameters: queryParameters,
        options: options,
        onReceiveProgress: onReceiveProgress,
      );
      final file = File(fileInfo,);
      if (await file.exists()) {
        if(Platform.isAndroid) await open_file.OpenFile.open(fileInfo,);
        if(Platform.isIOS) await open_file.OpenFile.open(fileInfo,);
        return true;
      }
      else {
        return false;
      }
    }
    ///NETWORK FAILURE
    catch (e) {
      getLogger(className: CLASS_NAME,).e(e,);
      return throw NetworkFailureError(type: e.failureType,);
    }
  }
}

extension ResponseClone on Response {
  Response<T> clone<T>() {
    return Response<T>(
      data: data,
      headers: headers,
      requestOptions: requestOptions,
      statusCode: statusCode,
      statusMessage: statusMessage,
      isRedirect: isRedirect,
      redirects: redirects,
      extra: extra,
    );
  }
}
