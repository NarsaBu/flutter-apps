import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String messageText;
  final String messageSender;
  final bool isMe;

  const MessageBubble(
      {required this.messageText,
      required this.messageSender,
      required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            '$messageSender',
            style: TextStyle(color: Colors.black54),
          ),
          Material(
            borderRadius: isMe
                ? const BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  )
                : const BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
            elevation: 5.0,
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                child: Text('$messageText')),
            textStyle: TextStyle(
              color: isMe ? Colors.white : Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
