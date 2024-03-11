import 'package:flutter/material.dart';

class SignUpTextFormField extends StatelessWidget {
  const SignUpTextFormField({
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
    );
  }
}
