import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:rest_api_ex/ui/sign_up/sign_up_button.dart';
import 'package:rest_api_ex/ui/sign_up/sign_up_form.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  bool showSpinner = false;
  final formKey = GlobalKey<FormState>();

  final userNickNameController = TextEditingController();
  final userEmailController = TextEditingController();
  final userPasswordController = TextEditingController();
  final userMobileNumberController = TextEditingController();
  final userResidenceController = TextEditingController();
  final promotionCodeController = TextEditingController();


  // 유효성 검사
  void _tryValidation() {
    final isValid = formKey.currentState!.validate();

    if( isValid ) {
      formKey.currentState!.save();
    }
  }

  @override
  void dispose() {
    super.dispose();

    userNickNameController.dispose();
    userEmailController.dispose();
    userPasswordController.dispose();
    userMobileNumberController.dispose();
    userResidenceController.dispose();
    promotionCodeController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('회원가입'),
      ),

      body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SignUpForm(
                  formKey: formKey,
                  userNickNameController: userNickNameController,
                  userEmailController: userEmailController,
                  userPasswordController: userPasswordController,
                  userMobileNumberController: userMobileNumberController,
                  userResidenceController: userResidenceController,
                  promotionCodeController: promotionCodeController,

                  onSignUpPressed: () {
                    _tryValidation();
                    setState(() {
                      // showSpinner = true;
                    });
                  },
                ),
              ],
            ),
          )
      ),

      bottomNavigationBar: SignUpButton(),
    );
  }
}
