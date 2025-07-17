import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.isCurrentUser,
    required this.data,
  });

  final bool isCurrentUser;
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 14.0),
      decoration: BoxDecoration(
        color: isCurrentUser ? Colors.green[200] : Colors.blue[300],
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(12),
          topRight: const Radius.circular(12),
          bottomLeft: isCurrentUser ? const Radius.circular(12) : Radius.zero,
          bottomRight: isCurrentUser ? Radius.zero : const Radius.circular(12),
        ),
      ),
      child: Text(data["message"] ?? '', style: TextStyle(fontSize: 16)),
    );
  }
}
