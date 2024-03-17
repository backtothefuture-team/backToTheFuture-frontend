import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rest_api_ex/data/model/user_model.dart';
import 'package:rest_api_ex/data/source/ErrorHandler.dart';
import 'package:rest_api_ex/data/source/rest_client.dart';
import 'package:rest_api_ex/config/user_info_text_form_field.dart';

import '../../config/inputValidation.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({
    required this.formKey,
    required this.userNickNameController,
    required this.userEmailController,
    required this.userPasswordController,
    required this.userMobileNumberController,
    required this.userResidenceController,
    required this.promotionCodeController,
    required this.onSignUpPressed,
    super.key});

  final GlobalKey<FormState> formKey;

  final TextEditingController userNickNameController;
  final TextEditingController userEmailController;
  final TextEditingController userPasswordController;
  final TextEditingController userMobileNumberController;
  final TextEditingController userResidenceController;
  final TextEditingController promotionCodeController;
  final VoidCallback onSignUpPressed;

  final RestClient restClient = GetIt.instance<RestClient>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [

              // 이름
              UserInfoTextFormField(
                controller: userNickNameController,
                validator: (value) => inputValidation(value, '이름'),
                decorationLabelText: '이름',
              ),


              // 비밀번호
              UserInfoTextFormField(
                controller: userPasswordController,
                validator: (value) => inputValidation(value, '비밀번호', minLength: 6),
                decorationLabelText: '비밀번호',
              ),


              // 비밀번호 확인
              UserInfoTextFormField(
                controller: null,
                validator: (value) => inputValidation(value, '비밀번호', confirmPassword: true),
                decorationLabelText: '비밀번호 확인',
              ),


              // 휴대전화번호
              UserInfoTextFormField(
                controller: userMobileNumberController,
                validator: (value) => inputValidation(value, '휴대전화번호'),
                decorationLabelText: '휴대전화번호',
              ),


              // 거주지
              UserInfoTextFormField(
                controller: userResidenceController,
                validator: (value) => inputValidation(value, '거주지'),
                decorationLabelText: '거주지',
              ),



              // 프로모션 코드
              UserInfoTextFormField(
                controller: promotionCodeController,
                validator: (value) => null,
                decorationLabelText: '프로모션 코드',
              ),


              // 회원가입 버튼
              ElevatedButton(
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

                  } catch(error) {
                    ErrorHandler.handle(error);
                  }
                },
                child: Text('회원가입')
              )
            ],
          ),
        ),
      )
    );
  }
}
