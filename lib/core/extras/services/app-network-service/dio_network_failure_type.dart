import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
enum NetworkFailureType {
  socketException,
  timeoutException,
  cancelException,
  certificateException,
  connectivityException,
  handshakeException,
  httpException,
  unknownException,
}

// Extension on NetworkFailureType to provide additional information and messages.
extension NetworkFailureTypeMessage on NetworkFailureType? {
  // Getter to provide a string identifier for each exception type.
  String get identifier {
    switch (this) {
      case NetworkFailureType.socketException: return "socket-exception";
      case NetworkFailureType.timeoutException: return "timeout-exception";
      case NetworkFailureType.cancelException: return "cancel-exception";
      case NetworkFailureType.certificateException: return "certificate-exception";
      case NetworkFailureType.connectivityException: return "connectivity-exception";
      case NetworkFailureType.handshakeException: return "handshake-exception";
      case NetworkFailureType.httpException: return "http-exception";
      default: return "unknown-exception";
    }
  }

  // Getter to provide the localization key for each exception type.
  String get messageKey {
    switch (this) {
      case NetworkFailureType.socketException: return "network_failure_socket_exception_message";
      case NetworkFailureType.timeoutException: return "network_failure_timeout_exception_message";
      case NetworkFailureType.cancelException: return "network_failure_cancel_exception_message";
      case NetworkFailureType.certificateException: return "network_failure_certificate_exception_message";
      case NetworkFailureType.connectivityException: return "network_failure_connectivity_exception_message";
      case NetworkFailureType.handshakeException: return "network_failure_handshake_exception_message";
      case NetworkFailureType.httpException: return "network_failure_http_exception_message";
      default: return "network_failure_unknown_exception_message";
    }
  }
}

// A custom error class for network failures, extending the Dart Error class.
class NetworkFailureError extends Error {
  // Nullable property to specify the type of network failure.
  final NetworkFailureType type;

  // Constructor requires a response type to be specified upon instantiation.
  NetworkFailureError({required this.type,});

  // Overriding the toString method to return a meaningful error message.
  @override String toString() {
    // Providing the identifier along with the localized message.
    return type.messageKey;
  }
}

extension NetworkFailureTypeExtension on dynamic {
  NetworkFailureType get failureType => _getFailureType();
  NetworkFailureType _getFailureType() {
    if (this is DioException && ((this as DioException).type == DioExceptionType.connectionError || (this as DioException).error is IOException || (this as DioException).error is SocketException || (this as DioException).error is WebSocketException)) {
      return NetworkFailureType.socketException;
    } else if(this is DioException && ((this as DioException).type == DioExceptionType.connectionTimeout || (this as DioException).type == DioExceptionType.receiveTimeout || (this as DioException).type == DioExceptionType.sendTimeout || (this as DioException).error == TimeoutException)) {
      return NetworkFailureType.timeoutException;
    } else if(this is DioException && (this as DioException).type == DioExceptionType.cancel) {
      return NetworkFailureType.cancelException;
    } else if(this is DioException && (this as DioException).type == DioExceptionType.badCertificate) {
      return NetworkFailureType.certificateException;
    } else if(this is DioException && (this as DioException).error is FormatException) {
      return NetworkFailureType.connectivityException;
    } else if(this is DioException && (this as DioException).error is HttpException){
      return NetworkFailureType.httpException;
    } else if(this is DioException && (this as DioException).error is HandshakeException){
      return NetworkFailureType.handshakeException;
    } else {
      return NetworkFailureType.unknownException;
    }
  }
}
