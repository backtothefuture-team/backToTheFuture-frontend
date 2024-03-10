import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){},
              child: Text('회원가입')
            ),

            SizedBox(width: 10,),

            ElevatedButton(
              onPressed: (){},
              child: Text('로그인')
            )
          ],
        ),
      ),
    );
  }
}
