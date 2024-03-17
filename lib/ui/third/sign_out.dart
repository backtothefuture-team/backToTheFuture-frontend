import 'package:flutter/material.dart';
import 'package:rest_api_ex/ui/sign_in/sign_in_main_page.dart';

class SignOut extends StatelessWidget {
  const SignOut({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MainSignInPage()
        ));
      },

      child: const Padding(
        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
        child: Center(
          child: Text(
            '로그아웃',
            style: TextStyle(
              decoration: TextDecoration.underline
            ),
          ),
        ),
      ),
    );
  }
}
