import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'signup_screen.dart';

class AuthContainer extends StatefulWidget {
  const AuthContainer({super.key});

  @override
  State<AuthContainer> createState() => _AuthContainerState();
}

class _AuthContainerState extends State<AuthContainer> {
  bool showLogin = true;

  void switchToSignup(){
    setState(() {
      showLogin = false;
    });
  }

  void swithToLogin(){
    setState(() {
      showLogin = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showLogin
    ? LoginScreen(
      onSignupTap: switchToSignup,
    )
        :SignupScreen(
      onLoginTap: swithToLogin
    );
  }
}
