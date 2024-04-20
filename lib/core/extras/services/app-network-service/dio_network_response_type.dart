enum NetworkResponseType {
  redirect,
  success,
  validationError,
  clientError,
  serverError,
  notProvided,
}

extension ResponseTypeMessage on NetworkResponseType {
  bool get isSuccessful => this == NetworkResponseType.redirect || this == NetworkResponseType.success;
  bool get hasError => this == NetworkResponseType.validationError || this == NetworkResponseType.clientError;
  bool get hasNoResponse => this == NetworkResponseType.serverError || this == NetworkResponseType.notProvided;

  String get identifier {
    switch (this) {
      case NetworkResponseType.redirect: return "redirect-response";
      case NetworkResponseType.success: return "success-response";
      case NetworkResponseType.validationError: return "validation-error-response";
      case NetworkResponseType.clientError: return "client-error-response";
      case NetworkResponseType.serverError: return "server-error-response";
      case NetworkResponseType.notProvided: return "no-response-error-response";
    }
  }

  String get messageKey {
    switch (this) {
      case NetworkResponseType.redirect: return "network_response_redirect_message";
      case NetworkResponseType.success: return "network_response_success_message";
      case NetworkResponseType.validationError: return "network_response_validation_error_message";
      case NetworkResponseType.clientError: return "network_response_client_error_message";
      case NetworkResponseType.serverError: return "network_response_server_error_message";
      case NetworkResponseType.notProvided: return "network_response_not_provided_message";
    }
  }
}

extension NetworkResponseStatusCodesExtension on int? {
  NetworkResponseType get responseType {
    if (this! >= 100 && this! < 200) {
      return NetworkResponseType.redirect;
    } else if (this! >= 200 && this! < 300) {
      return NetworkResponseType.success;
    } else if (this! >= 300 && this! < 400) {
      return NetworkResponseType.validationError;
    } else if (this! >= 400 && this! < 500) {
      return NetworkResponseType.clientError;
    } else if (this! >= 500 && this! < 600) {
      return NetworkResponseType.serverError;
    } else {
      return NetworkResponseType.notProvided;
    }
  }
}

class NetworkResponseError implements Exception {
  final int statusCode;
  final String? message;
  NetworkResponseType get responseType => statusCode.responseType;

  // Constructor requires a response type to be specified upon instantiation.
  NetworkResponseError({required this.statusCode, required this.message,}) {
    assert(responseType != NetworkResponseType.redirect || responseType !=  NetworkResponseType.success);
  }

  // Overriding the toString method to return a meaningful exception message.
  @override String toString() {
    // Providing the identifier along with the localized message.
    return message ?? statusCode.responseType.messageKey;
  }
}