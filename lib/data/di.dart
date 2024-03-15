import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rest_api_ex/data/source/rest_client.dart';

final instance = GetIt.instance;

Future<void> initModule() async {

  final dio = Dio();

  instance.registerLazySingleton(() => RestClient(dio));
}