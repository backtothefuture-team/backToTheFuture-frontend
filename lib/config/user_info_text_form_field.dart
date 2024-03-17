import 'package:flutter/material.dart';
import 'package:rest_api_ex/config/palette.dart';

class UserInfoTextFormField extends StatelessWidget {
  const UserInfoTextFormField({
    super.key,
    this.autoFocus,
    this.isButtonEnabled,
    this.textInputType,
    required this.controller,
    required this.validator,
    required this.decorationLabelText,
  });

  final bool? autoFocus;
  final bool? isButtonEnabled;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final String? Function(String?) validator;
  final String decorationLabelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // null 이면 autoFocus 기본 값 false
      autofocus: autoFocus ?? false,
      keyboardType: textInputType,
      controller: controller,
      validator: validator,
      decoration: _setTextFormDecoration(decorationLabelText),
    );
  }

  InputDecoration _setTextFormDecoration(String labelText) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(
        color: Colors.black54,
      ),

      // 이메일 인증 요청에서만 필요한 부분
      suffixIcon: isButtonEnabled != null && isButtonEnabled == true
          ? const Icon(Icons.check, color: Palette.primaryColor,)
          : null,

      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Palette.primaryColor,
        ),
      ),
    );
  }
}
