import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:get_it/get_it.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:rest_api_ex/data/model/oauth_model.dart';
import 'package:rest_api_ex/data/source/rest_client.dart';

import '../data/source/error_handler.dart';

class SocialSignIn {
  final RestClient _restClient = GetIt.instance<RestClient>();

  Future<void> kakaoTalkSignInProcess() async {
    // 카카오 실행 가능 여부 확인
    if (await isKakaoTalkInstalled()) {
      try {
        OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
        print('카카오톡으로 로그인 성공 ${token.accessToken}');
      } catch (error) {
        // 사용자가 카카오톡 설치 후 디바이스 권한 요청에서 로그인을 취소한 경우(의도적인 취소)
        if (error is PlatformException && error.code == 'unknown') {
          return;
        }

        // 카카오톡에 연결된 카카오 계정이 없는 경우, 카카오 계정으로 로그인
        try {
          await UserApi.instance.loginWithKakaoAccount();
        } catch (error) {
          if (error is PlatformException && error.code == 'unknown') {
            print('PlatformException');
            print(error.code);
          }
        }
      }
    } else {
      try {
        OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
        print('카카오톡으로 로그인 성공 ${token.accessToken}');

        _postAccountInfo();

        // todo: 회원정보 가져오기
        print('로그인');
      } catch (error) {
        ErrorHandler.handle(error).failure;
      }
    }
  }

  Future<void> naverSignInProcess() async {
    try {
      final NaverLoginResult result = await FlutterNaverLogin.logIn();

      if (result.status == NaverLoginStatus.loggedIn) {
        print(result.accessToken);
        print(result.account.name);
        _postAccountInfo();
      }
    } catch (error) {
      debugPrint('네이버 로그인 에러: $error');
    }
  }

  Future<void> _postAccountInfo() async {
    try {
      final oauthModel = OAuthModel(
        authorization: "authorization",
        providerType: "providerType",
        rolesType: "rolesType",
        state: "state",
      );

      await _restClient.oauthLogin(oauthModel.toJson());
    } catch (error) {
      debugPrint(ErrorHandler.handle(error).failure);
    }
  }
}
