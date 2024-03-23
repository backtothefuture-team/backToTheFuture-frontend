import 'package:dio/dio.dart';
import 'package:rest_api_ex/data/model/sign_in_response.dart';
import 'package:retrofit/http.dart';

part 'rest_client.g.dart';

// iOS ip
// @RestApi(baseUrl: 'http://127.0.0.1:8080/v1')
// Android ip
@RestApi(baseUrl: 'http://10.0.2.2:8080/v1')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST('/member/register')
  Future<void> createUser(@Body() Map<String, dynamic> body);

  @POST('/member/login/oauth')
  Future<void> oauthLogin(@Body() Map<String, dynamic> body);

  @POST('/member/login')
  Future<SignInResponse> emailLogin(
    @Field('email') String email,
    @Field('password') String password,
  );
}
