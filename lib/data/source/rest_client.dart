import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../model/user_model.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://localhost:8080/v1')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/member/register/{id}')
  Future<UserModel> getUser({@Path() required int id});
}