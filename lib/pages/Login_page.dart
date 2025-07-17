import 'package:flutter/material.dart';
import 'package:signal/components/costum_text.dart';
import '../components/costumtextfeild.dart';
import '../components/my_button.dart';
import '../services/authentication/auth_services.dart';

class LoginPage extends StatelessWidget {
  final void Function()? onTap;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key, required this.onTap});

  void login() async {
    final authService = AuthService();

    try {
      await authService.signIn(emailController.text, passwordController.text);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: appColors.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(Icons.message_rounded, color: appColors.primary, size: 65),
            //welcome back message
            CostumText(
              text: "Hey!, Welcome Back",
              size: 16,
              color: appColors.primary,
            ),
            SizedBox(height: 25),
            //email  text field
            CustomTextField(hintText: 'email', controller: emailController),
            SizedBox(height: 10),
            //password text field
            CustomTextField(
              hintText: 'password',
              hideText: true,
              controller: passwordController,
            ),
            SizedBox(height: 20),
            //Login button
            CostumButton(text: 'Login', onTap: login),
            SizedBox(height: 8),
            //don't have an account? register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "don't have an account?",
                  style: TextStyle(color: appColors.primary),
                ),
                SizedBox(width: 7),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "register now",
                    style: TextStyle(
                      color: appColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
