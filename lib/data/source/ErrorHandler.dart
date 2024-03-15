import 'package:dio/dio.dart';

class ErrorHandler implements Exception {
  late String failure;

  ErrorHandler.handle(dynamic error) {
    if( error is DioException ) {
      if (error.response != null) {
        if (error.response!.statusCode! >= 400 &&
            error.response!.statusCode! < 500) {
          // 클라이언트 오류인 경우
          final responseData = error.response!.data;
          final errorCode = responseData['errorCode'];
          final errorMessage = responseData['errorMessage'];
        } else if (error.response!.statusCode! >= 500 &&
            error.response!.statusCode! < 600) {
          // 서버 오류인 경우
          // 추가적인 조치 수행
          // ...
        }
      } else {
        print('그 외 에러');
      }
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