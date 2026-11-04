import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mi_app_prueba/core/errors/failure.dart';
import 'package:mi_app_prueba/core/network/enums/network_status.dart';
import 'package:mi_app_prueba/core/network/models/api_bad_response.dart';
import 'package:mi_app_prueba/core/network/models/api_collection.dart';

part 'base_event.dart';
part 'base_state.dart';

abstract class BaseBloc<T, R> extends Bloc<T, R> {
  BaseBloc(super.initialState);
  static const int _badRequest = 400;
  static const int _unauthorised = 401;
  static const int _forbidden = 403;
  static const int _notFound = 404;
  static const int _conflict = 409;
  static const int _internalServerError = 500;
  static const int _defaultError = 2;
  static const int _validationError = 32;

  Future<void> handleNetworkError(
    DioException exception,
    Emitter<BaseState> emit,
  ) async {
    late final String messageException;
    switch (exception.type) {
      case DioException.connectionTimeout:
        messageException = NetworkStatus.connectTimeout.toStatusKey();
        break;
      case DioExceptionType.sendTimeout:
        messageException = NetworkStatus.sendTimeout.toStatusKey();
        break;
      case DioExceptionType.receiveTimeout:
        messageException = NetworkStatus.receiveTimeout.toStatusKey();
        break;
      case DioExceptionType.badResponse:
        messageException = _handleBadResponse(exception);
        break;
      case DioExceptionType.connectionError:
        messageException = NetworkStatus.connectionError.toStatusKey();
        break;
      case DioExceptionType.cancel:
        messageException = NetworkStatus.cancel.toStatusKey();
        break;
      case DioExceptionType.badCertificate:
        messageException = NetworkStatus.badCertificate.toStatusKey();
        break;
      case DioExceptionType.unknown:
        messageException = NetworkStatus.cancel.toStatusKey();
        break;
      default:
        messageException = NetworkStatus.defaultError.toStatusKey();
        break;
    }

    emit(
      NetworkException(
        failure: Failure(
          code: exception.response?.statusCode ?? _defaultError,
          message: messageException,
        ),
      ),
    );
  }

  String _handleBadResponse(DioException exception) {
    try {
      final int statusCode = exception.response?.statusCode ?? _defaultError;
      final String message = _extractBackendMessage(exception.response?.data);

      if (message.isNotEmpty) return message;

      switch (statusCode) {
        case _unauthorised:
          return NetworkStatus.unauthorised.toStatusKey();
        case _forbidden:
          return NetworkStatus.forbidden.toStatusKey();
        case _notFound:
          return NetworkStatus.notFound.toStatusKey();
        case _badRequest:
        case _conflict:
          return _extractBadRequestMessage(exception.response?.data);
        case _internalServerError:
          return NetworkStatus.internetServerError.toStatusKey();
        default:
          return _extractErrorMessage(exception.response?.data);
      }
    } catch (exception) {
      return NetworkStatus.defaultError.toStatusKey();
    }
  }

  String _extractBackendMessage(Object? responseData) {
    if (responseData is Map<String, dynamic>) {
      return responseData['message'] ?? '';
    }
    return '';
  }

  String _extractBadRequestMessage(Map<String, dynamic>? data) {
    if (data == null || data['code'] == null) {
      return NetworkStatus.defaultError.toStatusKey();
    }
    if (data['code'] == _validationError) {
      final ApiCollection<ApiBadResponse> apiResponse =
          ApiCollection<ApiBadResponse>.fromJson(
            Map<String, dynamic>.from(data),
            ApiBadResponse.fromJson,
          );
      return apiResponse.data
          .map((ApiBadResponse data) => data.error)
          .join('\n');
    } else {
      return data['message'];
    }
  }

  String _extractErrorMessage(Object? data) {
    if (data is String) return data;
    if (data is Map<String, dynamic>) {
      return data.values
          .map((dynamic value) {
            if (value is List) return value.join('\n');
            if (value is String) return value;
            return value.toString();
          })
          .join('\n');
    }
    return '';
  }
}
