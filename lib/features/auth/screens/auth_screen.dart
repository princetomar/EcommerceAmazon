import 'package:amazon/common/widgets/custom_button.dart';
import 'package:amazon/common/widgets/custom_textField.dart';
import 'package:amazon/constants/global_variables.dart';
import 'package:flutter/material.dart';

// for choice of sign in and sign up, we are creating a enum - Auth
enum Auth {
  signIn,
  signUp,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = "/auth-screen";
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  Auth _auth = Auth.signUp;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              ListTile(
                tileColor: _auth == Auth.signUp
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: Text(
                  "Create Account",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: Auth.signUp,
                  groupValue: _auth,
                  activeColor: GlobalVariables.secondaryColor,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signUp)
                Container(
                  padding: EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                            controller: _nameController, hintText: "Name"),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                            controller: _emailController, hintText: "Email"),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                            controller: _passwordController,
                            hintText: "Password"),
                        SizedBox(
                          height: 10,
                        ),
                        CustomButton(onTap: () {}, text: "Sign Up"),
                      ],
                    ),
                  ),
                ),
              ListTile(
                tileColor: _auth == Auth.signIn
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: Text(
                  "Sign In",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: Auth.signIn,
                  groupValue: _auth,
                  activeColor: GlobalVariables.secondaryColor,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signIn)
                Container(
                  padding: EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signInFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                            controller: _emailController, hintText: "Email"),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                            controller: _passwordController,
                            hintText: "Password"),
                        SizedBox(
                          height: 10,
                        ),
                        CustomButton(onTap: () {}, text: "Sign In"),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
