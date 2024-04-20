class GeneralError extends Error implements Exception {
  final String message;
  GeneralError({required this.message,});
  @override String toString() => message;
}

extension ExceptionMesssageExtension on Exception {
  String get message {
    final e = this;
    return e.toString().split(':').last.trim();
  }
}

extension ErrorMesssageExtension on Error {
  String get message {
    final e = this;
    return e.toString().split(':').last.trim();
  }
}