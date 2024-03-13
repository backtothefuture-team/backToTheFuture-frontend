import 'package:dio/dio.dart';

class ErrorHandler implements Exception {
  late String failure;

  ErrorHandler.handle(dynamic error) {
    if( error is DioException ) {
      failure = _handleError(error);
      print('DioException >> $failure');
    } else {
      print('error');
    }
  }
}

String _handleError(DioException error) {
  switch( error.type ) {
    case DioExceptionType.connectionError:
      return 'connectionError';
    case DioExceptionType.connectionTimeout:
      return 'connectionTimeout';
    case DioExceptionType.sendTimeout:
      return 'sendTimeout';
    case DioExceptionType.receiveTimeout:
      return 'receiveTimeout';
    case DioExceptionType.badCertificate:
    return 'badCertificate';
    case DioExceptionType.badResponse:
    return 'badResponse';
    case DioExceptionType.cancel:
    return 'cancel';
    case DioExceptionType.unknown:
    return 'unknown';
    default:
      return 'default_error';
  }
}