import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:rest_api_ex/config/navigate_to.dart';
import 'package:rest_api_ex/ui/my_bottom_navigation.dart';
import 'package:rest_api_ex/ui/sign_up/sign_up_button.dart';
import 'package:rest_api_ex/ui/sign_up/sign_up_form.dart';

import '../../data/model/user_model.dart';
import '../../data/source/ErrorHandler.dart';
import '../../data/source/rest_client.dart';

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
  final userPasswordConfirmController = TextEditingController();
  final RestClient restClient = GetIt.instance<RestClient>();


  @override
  void dispose() {
    super.dispose();

    userNickNameController.dispose();
    userEmailController.dispose();
    userPasswordController.dispose();
    userPasswordConfirmController.dispose();
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
                  userPasswordConfirmController: userPasswordConfirmController,
                ),
              ],
            ),
          )
      ),

      bottomNavigationBar: SignUpButton(
        showSpinner: showSpinner,
        onSignUpPressed: _handleSignUpPressed,
      ),
    );
  }


  // 유효성 검사
  void _tryValidation() {
    final isValid = formKey.currentState!.validate();

    if( isValid ) {
      formKey.currentState!.save();
    }
  }


  void _handleSignUpPressed() async {
    _tryValidation();

    setState(() {
      showSpinner = true;
    });

    List<String> phoneNumber = ['010', '1234', '5678'];
    var userModel = UserModel(
        name: 'test1',
        email: 'test1@email.com',
        password: '123456',
        passwordConfirm: '123456',
        phoneNumber: phoneNumber);

    try {
      await restClient.createUser(userModel);

    } catch (error) {

      print(ErrorHandler.handle(error).failure);
    }
    // navigatePushAndRemoveUtilTo(context, const MyBottomNavigation());

    setState(() {
      showSpinner = false;
    });
  }
}
