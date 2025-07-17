import 'package:flutter/material.dart';
import '../services/authentication/auth_services.dart';
import 'glass_card.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final authService = AuthService();
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 40, vertical: 200),
      child: GlassCard(
        borderRadius: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Text(
              "Are you sure you want to logout?",
              style: TextStyle(
                fontSize: 18,
                color: appColors.tertiary,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GlassCard(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 5),
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: appColors.tertiary),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                GlassCard(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 5),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      authService.signOut();
                    },
                    child: Text(
                      "Logout",
                      style: TextStyle(color: appColors.primary),
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
