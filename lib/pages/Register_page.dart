import 'package:flutter/material.dart';
import 'package:signal/components/glass_card.dart';

import '../components/costum_text.dart';
import '../components/costumtextfeild.dart';
import '../components/my_button.dart';
import '../services/authentication/auth_services.dart';

class RegisterPage extends StatelessWidget {
  final void Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  void register(BuildContext context) {
    final authService = AuthService();
    if (passwordController.text == confirmController.text) {
      authService.signUp(emailController.text, passwordController.text);
    } else {
      showDialog(
        context: context,
        builder: (context) => GlassCard(
          child: AlertDialog(
              backgroundColor: Colors.transparent,
              title: Text("pwd doesn't match")),
        ),
      );
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
              text: "Let's create an account for you!",
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
            SizedBox(height: 10),
            //confirm password text field
            CustomTextField(
              hintText: 'confirm password',
              hideText: true,
              controller: confirmController,
            ),
            SizedBox(height: 20),
            //Login button
            CostumButton(text: 'register', onTap: () => register(context)),
            SizedBox(height: 8),
            //don't have an account? register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have a account?",
                  style: TextStyle(color: appColors.primary),
                ),
                SizedBox(width: 7),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login now",
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
