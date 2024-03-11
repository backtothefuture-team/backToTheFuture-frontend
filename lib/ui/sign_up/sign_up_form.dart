import 'package:flutter/material.dart';
import 'package:rest_api_ex/ui/sign_up/sign_up_text_form_field.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    required this.formKey,
    required this.userNameController,
    required this.userPasswordController,
    required this.userMobileNumberController,
    required this.userResidenceController,
    required this.promotionCodeController,
    required this.onSignUpPressed,
    super.key});

  final GlobalKey<FormState> formKey;

  final TextEditingController userNameController;
  final TextEditingController userPasswordController;
  final TextEditingController userMobileNumberController;
  final TextEditingController userResidenceController;
  final TextEditingController promotionCodeController;
  final VoidCallback onSignUpPressed;

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
              SignUpTextFormField(
                controller: userNameController,
                validator: (value) => _validate(value, '이름'),
                decorationLabelText: '이름',
              ),


              // 비밀번호
              SignUpTextFormField(
                controller: userPasswordController,
                validator: (value) => _validate(value, '비밀번호', minLength: 6),
                decorationLabelText: '비밀번호',
              ),


              // 비밀번호 확인
              SignUpTextFormField(
                controller: null,
                validator: (value) => _validate(value, '비밀번호', confirmPassword: true),
                decorationLabelText: '비밀번호 확인',
              ),


              // 휴대전화번호
              SignUpTextFormField(
                controller: userMobileNumberController,
                validator: (value) => _validate(value, '휴대전화번호'),
                decorationLabelText: '휴대전화번호',
              ),


              // 거주지
              SignUpTextFormField(
                controller: userResidenceController,
                validator: (value) => _validate(value, '거주지'),
                decorationLabelText: '거주지',
              ),



              // 프로모션 코드
              SignUpTextFormField(
                controller: promotionCodeController,
                validator: (value) => null,
                decorationLabelText: '프로모션 코드',
              ),


              // 회원가입 버튼
              ElevatedButton(
                onPressed: onSignUpPressed,
                child: Text('회원가입')
              )
            ],
          ),
        ),
      )
    );
  }


  String? _validate(String? value, String field, {int? minLength, bool confirmPassword = false}) {
    if( value == null || value.isEmpty ) {
      return '$field을(를) 입력해 주세요.';
    }

    if( minLength != null && value.length < minLength ) {
      return '$field는 $minLength자리 이상 입력해 주세요.';
    }

    if( confirmPassword && value != userPasswordController.text ) {
      return '비밀번호가 일치하지 않습니다.';
    }

    return null;
  }

}
