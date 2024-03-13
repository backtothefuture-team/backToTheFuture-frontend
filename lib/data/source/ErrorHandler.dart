import 'package:dio/dio.dart';

class ErrorHandler implements Exception {

  ErrorHandler.handle(dynamic error) {
    if( error is DioException ) {
      print('DioException');
    } else {
      print('error');
    }
  }
}