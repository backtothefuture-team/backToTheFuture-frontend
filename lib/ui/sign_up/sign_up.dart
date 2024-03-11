import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  bool showSpinner = false;
  var formKey = GlobalKey<FormState>();

  var userNameController = TextEditingController();
  var userPasswordController = TextEditingController();
  var userMobileNumberController = TextEditingController();


  // 유효성 검사
  void _tryValidation() {
    final isValid = formKey.currentState!.validate();

    if( isValid ) {
      formKey.currentState!.save();
    }
  }

  @override
  void dispose() {
    super.dispose();

    userNameController.dispose();
    userPasswordController.dispose();
    userMobileNumberController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('회원가입'),
      ),

      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [

                // 이름
                TextFormField(
                  controller: userNameController,
                  validator: (value) =>
                    value == '' ? '이름을 입력해 주세요.' : null,
                    decoration: _setTextFormDecoration('이름'),
                ),


                // 비밀번호
                TextFormField(
                  controller: userPasswordController,
                  validator: (value) =>
                  value == '' ? '비밀번호는 6자리 이상 입력해 주세요.' : null,
                  decoration: _setTextFormDecoration('비밀번호'),
                ),


                // 비밀번호 확인
                TextFormField(
                  validator: (value) =>
                  value == '' || value != userPasswordController.text ?
                    '비밀번호가 일치하지 않습니다.' : null,
                  decoration: _setTextFormDecoration('비밀번호 확인'),
                ),


                // 휴대전화번호
                TextFormField(
                  controller: userMobileNumberController,
                  validator: (value) =>
                  value == '' ? '휴대전화번호를 입력해 주세요.' : null,
                  decoration: _setTextFormDecoration('휴대전화번호'),
                ),


                // 거주지
                TextFormField(
                  controller: userNameController,
                  decoration: _setTextFormDecoration('거주지'),
                ),


                // 프로모션 코드
                TextFormField(
                  controller: userNameController,
                  decoration: _setTextFormDecoration('프로모션 코드'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _setTextFormDecoration(String labelText) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(
        color: Colors.black54,
      ),
    );
  }
}
