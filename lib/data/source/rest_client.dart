import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../model/user_model.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://localhost:8080/v1')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/member/register/{id}')
  Future<UserModel> getUser({@Path() required int id});

  @POST('/member/register')
  Future<UserModel> createUser(
    @Field('name') String name,
    @Field('email') String email,
    @Field('password') String password,
    @Field('passwordConfirm') String passwordConfirm,
    @Field('phoneNumber') List<String> phoneNumber,
  );
}
