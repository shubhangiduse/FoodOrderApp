import 'package:flutter/material.dart';
import 'package:flutter_assignment_shubhangi/Common_Widgets/company_name.dart';
import 'package:flutter_assignment_shubhangi/Common_Widgets/custom_textfield.dart';
import 'package:flutter_assignment_shubhangi/Common_Widgets/elevated_button.dart';
import 'package:flutter_assignment_shubhangi/Screens/LogInPage/login_page.dart';
import 'package:flutter_assignment_shubhangi/Screens/SignUpPage/signup_controller.dart';
import 'package:flutter_assignment_shubhangi/Utilities/validation.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final signUpController = SignUpController();
  @override
  void dispose() {
    _userNameController.dispose();
    _emailIdController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const CompanyName(),
                      const SizedBox(
                        height: 50,
                      ),
                      buildUserName(),
                      buildEmailId(),
                      buildPassword(),
                      buildConfirmPassword(),
                      RoundedElevatedButton(
                        title: 'Register',
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            signUpController.createUser(
                                _emailIdController.text.trim(), _passwordController.text.trim());
                            // final SharedPreferences _prefs = await SharedPreferences.getInstance();

                            // _prefs.setString('UserName', _userNameController.text.trim());
                            // _prefs.setString('EmailId', _emailIdController.text.trim());

                            Get.offAll(() => const LogInPage());
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildUserName() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BuildTextFormField(
        controller: _userNameController,
        labelText: 'User Name',
        validator: Validator.validateUserNameLength,
      ),
    );
  }

  Padding buildEmailId() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BuildTextFormField(
        controller: _emailIdController,
        labelText: 'Email id',
        validator: Validator.validateEmailId,
      ),
    );
  }

  Padding buildPassword() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BuildTextFormField(
        controller: _passwordController,
        labelText: 'Password',
        obsecureText: true,
        validator: Validator.validatePasswordLength,
      ),
    );
  }

  Padding buildConfirmPassword() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BuildTextFormField(
        controller: _confirmPasswordController,
        labelText: 'Confirm Password',
        obsecureText: true,
        validator: Validator.validatePasswordLength,
      ),
    );
  }
}
