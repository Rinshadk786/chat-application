import 'package:flutter/material.dart';
import 'package:signal/pages/Login_page.dart';
import 'package:signal/pages/Register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLogin = true;

  void togglePages() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showLogin
        ? LoginPage(onTap: togglePages)
        : RegisterPage(onTap: togglePages);
  }
}
