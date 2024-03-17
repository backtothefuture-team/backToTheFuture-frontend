import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../config/palette.dart';
import '../../data/model/user_model.dart';
import '../../data/source/ErrorHandler.dart';
import '../../data/source/rest_client.dart';

class SignUpButton extends StatelessWidget {
  SignUpButton({super.key});

  final RestClient restClient = GetIt.instance<RestClient>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(15.0),
          backgroundColor: Palette.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),

        onPressed: () async {
          List<String> phoneNumber = ['010', '5678', '1234'];
          var userModel = UserModel(
              name: 'test1',
              email: 'test1@email.com',
              password: '123456',
              passwordConfirm: '123456',
              phoneNumber: phoneNumber);

          try {
            await restClient.createUser(userModel);
          } catch (error) {
            ErrorHandler.handle(error);
          }
        },

        child: const Text(
          '가입하기',
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
    );
  }
}
