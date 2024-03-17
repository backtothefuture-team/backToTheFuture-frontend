import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../config/palette.dart';
import '../../data/model/user_model.dart';
import '../../data/source/ErrorHandler.dart';
import '../../data/source/rest_client.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    required this.showSpinner,
    required this.onSignUpPressed,
    super.key,
  });

  final bool showSpinner;
  final VoidCallback onSignUpPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(15.0),
          backgroundColor: Palette.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),

        onPressed: !showSpinner ? onSignUpPressed : null,

        child: const Text(
          '가입하기',
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
    );
  }
}
