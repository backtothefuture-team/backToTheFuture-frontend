import 'package:flutter/material.dart';

import '../../config/gaps.dart';
import '../../config/inputValidation.dart';
import '../../config/navigate_to.dart';
import '../../config/palette.dart';
import '../../config/user_info_text_form_field.dart';
import '../my_bottom_navigation.dart';

class SignInEmailForm extends StatelessWidget {
  const SignInEmailForm({
    required this.formKey,
    required this.userEmailController,
    required this.userPasswordController,
    super.key});

  final GlobalKey<FormState> formKey;

  final TextEditingController userEmailController;
  final TextEditingController userPasswordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            // 이메일
            UserInfoTextFormField(
              controller: userEmailController,
              validator: validateEmail,
              decorationLabelText: '이메일을 입력해 주세요',
            ),

            Gaps.gapH20,

            // 비밀번호
            UserInfoTextFormField(
              controller: userPasswordController,
              validator: validatePassword,
              decorationLabelText: '비밀번호를 입력해 주세요',
            ),

            Gaps.gapH20,

            // 로그인 버튼
            signInButton(context),
          ],
        ),
      ),
    );
  }

  // 유효성 검사
  void _tryValidation() {
    final isValid = formKey.currentState!.validate();

    if( isValid ) {
      print("valid");
      formKey.currentState!.save();
    }
  }

  // 로그인 버튼
  Widget signInButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Palette.primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
          ),
      ),

      onPressed: () {

        // 유효성 검사
        _tryValidation();

        try {

          print('userEmail > ${userEmailController.text}');
          print('userPassword > ${userPasswordController.text}');

          navigatePushAndRemoveUtilTo(context, const MyBottomNavigation());

        } catch(error) {
          print('로그인 에러 > $error');
        }
      },

      child: const Text(
        '로그인',
        style: TextStyle(
            color: Palette.whiteTextColor
        ),
      ),
    );
  }
}