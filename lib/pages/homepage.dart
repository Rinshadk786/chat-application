import 'package:flutter/material.dart';
import 'package:signal/components/costum_text.dart';
import 'package:signal/services/chat/chat_services.dart';
import '../components/my_drawer.dart';
import '../components/userTile.dart';
import '../services/authentication/auth_services.dart';
import 'chat_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;

    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Home Page"),
      ),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUserStream(),
      builder: (context, snapshot) {
        // error

        if (snapshot.hasError) {
          return Center(
            child: CostumText(
              text: "Error: ${snapshot.error}",
              size: 50,
              color: Theme.of(context).colorScheme.primary,
            ),
          );
        }
        //loading

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text("Loading...."));
        }

        // Listview
        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _builduserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  Widget _builduserListItem(
    Map<String, dynamic> userData,
    BuildContext context,
  ) {
    if (userData['email'] != _authService.currentUser!.email) {
      return UserTile(
        text: userData["email"],
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiverEmail: userData["email"],
                receiverID: userData["uid"],
              ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}
