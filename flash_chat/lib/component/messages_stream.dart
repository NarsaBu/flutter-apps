import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/component/message_bubble.dart';
import 'package:flash_chat/screen/chat_screen.dart';
import 'package:flutter/material.dart';

class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: fireStore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data!.docs;
        List<MessageBubble> messageBubbles = [];
        for (var message in messages) {
          final messageText = (message.data()! as Map)['text'];
          final messageSender = (message.data()! as Map)['sender'];

          final currentUser = loggedInUser!.email;

          messageBubbles.add(
            MessageBubble(
              messageText: messageText,
              messageSender: messageSender,
              isMe: currentUser == messageSender,
            ),
          );
        }
        return Expanded(
            child: ListView(
          reverse: true,
          children: messageBubbles,
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        ));
      },
    );
  }
}
