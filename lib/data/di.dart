import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:rest_api_ex/data/source/rest_client.dart';

final instance = GetIt.instance;

Future<void> initModule() async {

  final dio = Dio();

  instance.registerLazySingleton(() => RestClient(dio));

  // 웹 환경에서 카카오 로그인을 정상적으로 완료하려면 runApp() 호출 전 아래 메서드 호출 필요
  WidgetsFlutterBinding.ensureInitialized();
  // runApp() 호출 전 Flutter SDK 초기화
  KakaoSdk.init(
    nativeAppKey: '81744e25b42accb8e343708484a15cda',
    javaScriptAppKey: '80398c7b09ada91d124f99e1503edfa2',
  );
}