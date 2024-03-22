import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../model/user_model.dart';

part 'rest_client.g.dart';

// iOS ip
@RestApi(baseUrl: 'http://172.30.1.69:8080/v1')
// Android ip
// @RestApi(baseUrl: 'http://10.0.2.2:8080/v1')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/member/register/{id}')
  Future<UserModel> getUser({@Path() required int id});

  @POST('/member/register')
  Future<void> createUser(@Body() Map<String, dynamic> body);
  
  @POST('/member/login/oauth')
  Future<void> oauthLogin(@Body() Map<String, dynamic> body);
}
