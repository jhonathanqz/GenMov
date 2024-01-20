abstract class ApiTokenExceptions implements Exception {
  final String message;

  ApiTokenExceptions(this.message);
}

class ApiConnectionException extends ApiTokenExceptions {
  ApiConnectionException(super.message);
}

class ApiJwtTokenException extends ApiTokenExceptions {
  ApiJwtTokenException(super.message);
}

class ApiErrorException extends ApiTokenExceptions {
  ApiErrorException(super.message);
}

class ApiInternalErrorException extends ApiTokenExceptions {
  ApiInternalErrorException(super.message);
}

class ApiBadRequestException extends ApiTokenExceptions {
  ApiBadRequestException(super.message);
}

class ApiUnauthorizedException extends ApiTokenExceptions {
  ApiUnauthorizedException(super.message);
}

class ApiForbiddenRequestException extends ApiTokenExceptions {
  ApiForbiddenRequestException(super.message);
}

class ApiTimeoutException extends ApiTokenExceptions {
  ApiTimeoutException(super.message);
}

class ApiSessionExpiredException extends ApiTokenExceptions {
  ApiSessionExpiredException(super.message);
}

class ApiNotFoundException extends ApiTokenExceptions {
  ApiNotFoundException(super.message);
}

class AppCatchException extends ApiTokenExceptions {
  AppCatchException(super.message);
}
