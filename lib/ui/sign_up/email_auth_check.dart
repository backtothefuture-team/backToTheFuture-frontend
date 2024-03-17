import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:rest_api_ex/config/inputValidation.dart';
import 'package:rest_api_ex/config/navigate_to.dart';
import 'package:rest_api_ex/config/user_info_text_form_field.dart';

import '../../config/palette.dart';
import 'sign_up.dart';

class EmailAuthCheck extends StatefulWidget {
  const EmailAuthCheck({super.key});

  @override
  State<EmailAuthCheck> createState() => _EmailAuthCheckState();
}

class _EmailAuthCheckState extends State<EmailAuthCheck> {
  bool showSpinner = false;
  bool _isButtonEnabled = false;
  final formKey = GlobalKey<FormState>();
  final _authCodeController = TextEditingController();
  final int authCodeLength = 6;


  // 유효성 검사
  void _tryValidation() {
    final isValid = formKey.currentState!.validate();

    if (isValid) {
      formKey.currentState!.save();
    }
  }


  @override
  void initState() {
    super.initState();

    // 텍스트 길이에 따라 버튼 색상 활성화를 하기 위한 콜백 함수
    // 함수를 호출하는 게 아니라, 콜백으로 전달하기 때문에 괄호를 사용하지 않는다.
    _authCodeController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    super.dispose();
    _authCodeController.dispose();
  }

  // 텍스트 길이에 따라 버튼 색상 활성화를 하기 위한 콜백 함수
  void _updateButtonState() {
    setState(() {
      if( _authCodeController.text.length == authCodeLength ) {
        _isButtonEnabled = true;
      } else {
        _isButtonEnabled = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입'),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  // 설명 문구,
                  description(),

                  // 인증 코드 입력
                  UserInfoTextFormField(
                    autoFocus: true,
                    isButtonEnabled: _isButtonEnabled == true ? true : false,
                    textInputType: TextInputType.number,
                    controller: _authCodeController,
                    validator: validateAuthCode,
                    decorationLabelText: '코드 6자리 입력',
                  ),

                  // 이메일 인증하기 버튼
                  emailAuthRequestButton(context, _isButtonEnabled),

                  // 코드 재전송
                  resendCode(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 설명 문구
  Widget description() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '이메일 인증하기',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),

        // 사용자가 입력한 이메일 주소
        Text(
          'test@email.com',
          style: TextStyle(fontSize: 17.0, color: Palette.primaryColor),
        ),
        Text(
          '위 메일로 보내드린 인증 코드를 입력해 주세요.',
          style: TextStyle(
            fontSize: 17.0,
          ),
        )
      ],
    );
  }

  // 이메일 인증하기 버튼
  Widget emailAuthRequestButton(BuildContext context, bool buttonEnabled) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
        _isButtonEnabled ? Palette.primaryColor : Palette.disabledColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
      onPressed: () {
        _tryValidation();

        navigateTo(context, const SignUp());
      },
      child: const Text(
        '이메일 인증하기',
        style: TextStyle(
          color: Palette.whiteTextColor,
        ),
      ),
    );
  }

  // 인증 코드 재전송
  Widget resendCode() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '메일이 오지 않았다면 스팸 메일함을 확인하거나',
          style: TextStyle(
            color: Palette.disabledColor,
          ),
        ),

        Row(
          children: [
            const Text(
              '코드 재전송을 요청하세요.',
              style: TextStyle(
                color: Palette.disabledColor,
              ),
            ),

            GestureDetector(
              onTap: (){},
              child: const Text(
                '인증 코드 재전송',
                style: TextStyle(
                    decoration: TextDecoration.underline
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
