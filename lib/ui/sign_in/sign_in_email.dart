import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:rest_api_ex/config/gaps.dart';
import 'package:rest_api_ex/data/source/rest_client.dart';

import '../../config/navigate_to.dart';
import '../../config/palette.dart';
import '../../config/user_info_text_form_field.dart';
import '../../config/validationCheck.dart';
import '../../data/source/error_handler.dart';
import '../my_bottom_navigation.dart';
import '../sign_up/email_auth_request.dart';

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 이메일 입력 폼, 비밀번호 입력 폼, 로그인 버튼
              Form(
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
                      _signInButton(context),
                    ],
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('비밀번호 찾기'),
                  Gaps.gapW15,
                  Text(' | '),
                  Gaps.gapW15,
                  // 회원가입 버튼
                  _signUpButton(context),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // 로그인 버튼
  Widget _signInButton(BuildContext context) {
    final RestClient restClient = GetIt.instance<RestClient>();

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Palette.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
      onPressed: () async {
        ValidationCheck().allUserInputValidation(formKey);

        try {
          String email = 'test1@email.com';
          String password = '123456';
          // String email = userEmailController.text;
          // String password = userPasswordController.text;

          await restClient.emailLogin(email, password);

          if (context.mounted) {
            navigatePushAndRemoveUtilTo(context, const MyBottomNavigation());
          }
        } catch (error) {
          final errorMessage = ErrorHandler.handle(error).failure;

          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
              ),
            );
          }
        }
      },
      child: const Text(
        '로그인',
        style: TextStyle(color: Palette.whiteTextColor),
      ),
    );
  }

  // 회원가입 버튼
  Widget _signUpButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(context, const EmailAuthRequest());
      },
      child: const Text(
        '회원가입',
        style: TextStyle(decoration: TextDecoration.underline),
      ),
    );
  }
}
