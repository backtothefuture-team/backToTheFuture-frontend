import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rest_api_ex/config/gaps.dart';
import 'package:rest_api_ex/config/validationCheck.dart';
import 'package:rest_api_ex/config/user_info_text_form_field.dart';

import '../../config/palette.dart';
import 'term_of_use.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    required this.formKey,
    required this.userNickNameController,
    required this.userEmailController,
    required this.userPasswordController,
    required this.userPasswordConfirmController,
    super.key});

  final GlobalKey<FormState> formKey;

  final TextEditingController userNickNameController;
  final TextEditingController userEmailController;
  final TextEditingController userPasswordController;
  final TextEditingController userPasswordConfirmController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 이메일
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('이메일'),
                  Gaps.gapH5,
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'test@email.com',
                      labelStyle: TextStyle(
                        color: Colors.black54,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Palette.disabledColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // 비밀번호
              Column(
                children: [
                  _buildTextFormField(
                    '비밀번호',
                    true,
                    UserInfoTextFormField(
                      controller: userPasswordController,
                      validator: validatePassword,
                      decorationLabelText: '비밀번호',
                    ),
                  ),

                  Gaps.gapH10,

                  // 비밀번호 확인
                  UserInfoTextFormField(
                    controller: userPasswordConfirmController,
                    validator: (value) => validateConfirmPassword(
                      value,
                      userPasswordController.text,
                    ),
                    decorationLabelText: '비밀번호 확인',
                  )
                ],
              ),

              // 닉네임
              _buildTextFormField(
                '닉네임',
                true,
                UserInfoTextFormField(
                  controller: userNickNameController,
                  validator: validateNickName,
                  decorationLabelText: '닉네임을 입력해 주세요',
                ),
              ),

              // 이용약관 동의
              const TermOfUse(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(String label, bool isNecessary,
      UserInfoTextFormField userInfoTextFormField) {
    return Column(
      children: [
        Row(
          children: [
            Text(label),
            isNecessary
                ? const Text('*', style: TextStyle(color: Colors.red))
                : const Text(''),
          ],
        ),
        Gaps.gapH5,
        userInfoTextFormField
      ],
    );
  }
}
