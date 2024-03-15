import 'package:flutter/material.dart';
import 'package:rest_api_ex/config/gaps.dart';

import '../sign_up/sign_up.dart';
import 'sign_in_email.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // 로고와 인사말
            signInTitle(),

            // 이메일 로그인 버튼
            emailSignInButton(context),
          ],
        ),
      ),
    );
  }

  // 로고와 인사말
  Widget signInTitle() {
    return Column(
      children: [
        Image.asset('assets/images/btf_logo.png'),
        Gaps.gapH20,
        const Text(
          '마감 세일 상품을 \n서프라이즈 백으로 만나보세요',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget emailSignInButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const EmailSignIn(),
            ));
      },
      child: Text('이메일 로그인'),
    );
  }
}
