import 'package:flutter/material.dart';
import 'package:flutter_assignment_shubhangi/Common_Widgets/alert_dialog.dart';
import 'package:flutter_assignment_shubhangi/Common_Widgets/company_name.dart';
import 'package:flutter_assignment_shubhangi/Common_Widgets/custom_textfield.dart';
import 'package:flutter_assignment_shubhangi/Common_Widgets/elevated_button.dart';
import 'package:flutter_assignment_shubhangi/Screens/LogInPage/login_controller.dart';
import 'package:flutter_assignment_shubhangi/Screens/ProductListPage/product_list.dart';
import 'package:flutter_assignment_shubhangi/Screens/SignUpPage/signup_page.dart';
import 'package:flutter_assignment_shubhangi/Utilities/shared_pref.dart';
import 'package:flutter_assignment_shubhangi/Utilities/validation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final logInController = LogInController();

  @override
  void initState() {
    getUserDetailsFromSP();
    super.initState();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _emailIdController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  

  void getUserDetailsFromSP() async {
    Map userDetails = await CustomSharedPref.getUserDetails();
    if (userDetails['EmailId'] != '') {
      Get.offAll(const ProductList());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
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
                      buildLoginButton(),
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

  Row buildLoginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RoundedElevatedButton(
          title: 'Log in',
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              bool isValidUser = await logInController.logInUser(
                  _emailIdController.text.trim(), _passwordController.text.trim());
              if (isValidUser) {
                final SharedPreferences _prefs = await SharedPreferences.getInstance();

                _prefs.setString('UserName', _userNameController.text.trim());
                _prefs.setString('EmailId', _emailIdController.text.trim());

                Get.offAll(() => const ProductList());
              } else {
                CustomAlertDialog.alertBox(
                    'Wrong Credential!', 'Please enter correct email id and password to login.', () {
                  Get.back();
                });
              }
            }
          },
        ),
        const SizedBox(
          width: 10,
        ),
        TextButton(
          onPressed: () {
            Get.to(() => const SignUpPage());
          },
          child: const Text(
            'Sign up',
            style: TextStyle(fontSize: 20, decoration: TextDecoration.underline),
          ),
        )
      ],
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
}
