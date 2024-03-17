import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:rest_api_ex/config/gaps.dart';
import 'package:rest_api_ex/ui/sign_in/sign_in_email_form.dart';
import 'package:rest_api_ex/ui/sign_up/sign_up.dart';

import '../../config/navigate_to.dart';

class EmailSignIn extends StatefulWidget {
  const EmailSignIn({super.key});

  @override
  State<EmailSignIn> createState() => _EmailSignInState();
}

class _EmailSignInState extends State<EmailSignIn> {
  bool showSpinner = false;
  final formKey = GlobalKey<FormState>();
  final userEmailController = TextEditingController();
  final userPasswordController = TextEditingController();

  // 유효성 검사
  void _tryValidation() {
    final isValid = formKey.currentState!.validate();

    if (isValid) {
      formKey.currentState!.save();
    }
  }

  @override
  void dispose() {
    super.dispose();
    userEmailController.dispose();
    userPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('이메일 로그인'),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Column(
          children: [
            // 이메일 입력 폼, 비밀번호 입력 폼, 로그인 버튼
            SignInEmailForm(
              formKey: formKey,
              userEmailController: userEmailController,
              userPasswordController: userPasswordController,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('비밀번호 찾기'),
                Gaps.gapW15,
                Text(' | '),
                Gaps.gapW15,
                // 회원가입 버튼
                signUpButton(context),
              ],
            )
          ],
        ),
      ),
    );
  }

  // 회원가입 버튼
  Widget signUpButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(context, const SignUp());
      },
      child: const Text(
        '회원가입',
        style: TextStyle(decoration: TextDecoration.underline),
      ),
    );
  }
}
