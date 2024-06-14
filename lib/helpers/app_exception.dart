class AppException implements Exception {
  final _message;
  final _prefix;
  AppException([this._message, this._prefix]);
  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException([message]) : super(message, "Unauthorized: ");
}

class UnProcessableEntityException extends AppException {
  UnProcessableEntityException([message])
      : super(message, "Unprocessable Entity: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}
