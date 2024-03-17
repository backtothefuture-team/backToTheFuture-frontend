import 'package:flutter/material.dart';
import 'package:rest_api_ex/config/palette.dart';

class UserInfoTextFormField extends StatelessWidget {
  const UserInfoTextFormField({
    super.key,
    required this.controller,
    required this.validator,
    required this.decorationLabelText,
  });

  final TextEditingController? controller;
  final String? Function(String?) validator;
  final String decorationLabelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Palette.primaryColor
        )
      )
    );
  }
}
