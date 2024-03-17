import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:rest_api_ex/config/gaps.dart';
import 'package:rest_api_ex/config/inputValidation.dart';
import 'package:rest_api_ex/config/user_info_text_form_field.dart';

import '../../config/navigate_to.dart';
import '../../config/palette.dart';
import 'email_auth_check.dart';

class EmailAuthRequest extends StatefulWidget {
  const EmailAuthRequest({super.key});

  @override
  State<EmailAuthRequest> createState() => _EmailAuthRequestState();
}

class _EmailAuthRequestState extends State<EmailAuthRequest> {
  bool showSpinner = false;
  bool _isButtonEnabled = false;
  final formKey = GlobalKey<FormState>();
  final _userEmailController = TextEditingController();

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
    _userEmailController.addListener(_updateButtonState);
  }


  @override
  void dispose() {
    super.dispose();
    _userEmailController.dispose();
  }


  // 텍스트 길이에 따라 버튼 색상 활성화를 하기 위한 콜백 함수
  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = _userEmailController.text.length > 5;
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
          height: MediaQuery.of(context).size.height * 0.4,
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

                  // 이메일 입력
                  UserInfoTextFormField(
                    autoFocus: true,
                    isButtonEnabled: _isButtonEnabled == true ? true : false,
                    textInputType: TextInputType.emailAddress,
                    controller: _userEmailController,
                    validator: validateEmail,
                    decorationLabelText: '',
                  ),

                  // 이메일 인증 요청 버튼
                  emailAuthRequestButton(context, _isButtonEnabled)
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
          '이메일을 입력해 주세요',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),

        Gaps.gapH10,
        Text(
          '인증 코드를 보내드려요',
          style: TextStyle(fontSize: 17.0,),
        )
      ],
    );
  }

  // 이메일 인증 요청 버튼
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

        // navigateTo(context, const EmailAuthCheck());
      },

      child: const Text(
        '이메일 인증 요청',
        style: TextStyle(
          color: Palette.whiteTextColor,
        ),
      ),
    );
  }
}
