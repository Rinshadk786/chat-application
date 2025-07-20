import 'package:flutter/material.dart';
import 'package:signal/pages/Settings.dart';
import 'glass_card.dart';
import 'logout _dialog.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    void logout(BuildContext context) {
      showDialog(context: context, builder: (context) => LogoutDialog());
    }

    return Drawer(
      backgroundColor: Colors.transparent,
      child: GlassCard(
        x: .5,
        y: 4,
        elevation: 3,
        child: Column(
          children: [
            DrawerHeader(child: Icon(Icons.message, size: 50)),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
                leading: Icon(Icons.home),
                title: Text("H O M E"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (builder) => Settings()),
                  );
                },
                leading: Icon(Icons.settings),
                title: Text("S E T T I N G S"),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: ListTile(
                onTap: () => logout(context),
                leading: Icon(Icons.logout),
                title: Text("L O G O U T"),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
