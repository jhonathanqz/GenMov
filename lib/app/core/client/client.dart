import 'package:dio/dio.dart';

import '../../shared/helpers/api_helper.dart';
import '../../utils/strings.dart';
import '../exceptions/api_exception.dart';
import 'i_client.dart';

class Client implements IClient {
  final Dio _client;

  Client({
    required Dio client,
  }) : _client = client;

  @override
  Future<dynamic> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _client.post(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw ApiTimeoutException(Strings.connectTimeout);
      }

      if (e.type == DioExceptionType.connectionError) {
        throw ApiConnectionException(Strings.apiConnectionError);
      }
      switch (e.response?.statusCode) {
        case 400:
          throw ApiBadRequestException(
              ApiHelper.buildMessageResponse(e.response));
        case 401:
          throw ApiUnauthorizedException(
              ApiHelper.buildMessageResponse(e.response));
        case 403:
          throw ApiForbiddenRequestException(
              ApiHelper.buildMessageResponse(e.response));
        case 404:
          throw ApiNotFoundException(
              ApiHelper.buildMessageResponse(e.response));
        case 412:
          throw ApiSessionExpiredException(
              ApiHelper.buildMessageResponse(e.response));
        case 500:
          throw ApiInternalErrorException(
              ApiHelper.buildMessageResponse(e.response));
        default:
          throw ApiErrorException(
            ApiHelper.buildMessageResponse(e.response),
          );
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _client.put(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw ApiTimeoutException(Strings.connectTimeout);
      }

      if (e.type == DioExceptionType.connectionError) {
        throw ApiConnectionException(Strings.apiConnectionError);
      }
      switch (e.response?.statusCode) {
        case 400:
          throw ApiBadRequestException(
              ApiHelper.buildMessageResponse(e.response));
        case 401:
          throw ApiUnauthorizedException(
              ApiHelper.buildMessageResponse(e.response));
        case 403:
          throw ApiForbiddenRequestException(
              ApiHelper.buildMessageResponse(e.response));
        case 404:
          throw ApiNotFoundException(
              ApiHelper.buildMessageResponse(e.response));
        case 412:
          throw ApiSessionExpiredException(
              ApiHelper.buildMessageResponse(e.response));
        case 500:
          throw ApiInternalErrorException(
              ApiHelper.buildMessageResponse(e.response));
        default:
          throw ApiErrorException(
            ApiHelper.buildMessageResponse(e.response),
          );
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _client.patch(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw ApiTimeoutException(Strings.connectTimeout);
      }

      if (e.type == DioExceptionType.connectionError) {
        throw ApiConnectionException(Strings.apiConnectionError);
      }
      switch (e.response?.statusCode) {
        case 400:
          throw ApiBadRequestException(
              ApiHelper.buildMessageResponse(e.response));
        case 401:
          throw ApiUnauthorizedException(
              ApiHelper.buildMessageResponse(e.response));
        case 403:
          throw ApiForbiddenRequestException(
              ApiHelper.buildMessageResponse(e.response));
        case 404:
          throw ApiNotFoundException(
              ApiHelper.buildMessageResponse(e.response));
        case 412:
          throw ApiSessionExpiredException(
              ApiHelper.buildMessageResponse(e.response));
        case 500:
          throw ApiInternalErrorException(
              ApiHelper.buildMessageResponse(e.response));
        default:
          throw ApiErrorException(
            ApiHelper.buildMessageResponse(e.response),
          );
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _client.delete(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw ApiTimeoutException(Strings.connectTimeout);
      }

      if (e.type == DioExceptionType.connectionError) {
        throw ApiConnectionException(Strings.apiConnectionError);
      }
      switch (e.response?.statusCode) {
        case 400:
          throw ApiBadRequestException(
              ApiHelper.buildMessageResponse(e.response));
        case 401:
          throw ApiUnauthorizedException(
              ApiHelper.buildMessageResponse(e.response));
        case 403:
          throw ApiForbiddenRequestException(
              ApiHelper.buildMessageResponse(e.response));
        case 404:
          throw ApiNotFoundException(
              ApiHelper.buildMessageResponse(e.response));
        case 412:
          throw ApiSessionExpiredException(
              ApiHelper.buildMessageResponse(e.response));
        case 500:
          throw ApiInternalErrorException(
              ApiHelper.buildMessageResponse(e.response));
        default:
          throw ApiErrorException(
            ApiHelper.buildMessageResponse(e.response),
          );
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _client.get(
        path,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw ApiTimeoutException(Strings.connectTimeout);
      }

      if (e.type == DioExceptionType.connectionError) {
        throw ApiConnectionException(Strings.apiConnectionError);
      }
      switch (e.response?.statusCode) {
        case 400:
          throw ApiBadRequestException(
              ApiHelper.buildMessageResponse(e.response));
        case 401:
          throw ApiUnauthorizedException(
              ApiHelper.buildMessageResponse(e.response));
        case 403:
          throw ApiForbiddenRequestException(
              ApiHelper.buildMessageResponse(e.response));
        case 404:
          throw ApiNotFoundException(
              ApiHelper.buildMessageResponse(e.response));
        case 412:
          throw ApiSessionExpiredException(
              ApiHelper.buildMessageResponse(e.response));
        case 500:
          throw ApiInternalErrorException(
              ApiHelper.buildMessageResponse(e.response));
        default:
          throw ApiErrorException(
            ApiHelper.buildMessageResponse(e.response),
          );
      }
    } catch (e) {
      rethrow;
    }
  }
}
