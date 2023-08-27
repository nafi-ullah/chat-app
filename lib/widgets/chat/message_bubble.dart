import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
   MessageBubble(
       this.message,
       this.isMe,
       this.userName,
   {required this.key}
       );

  final String message;
  final bool isMe;
  final String userName;
  final Key key;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration:  BoxDecoration(
            color: isMe ? Colors.grey[300] : Colors.greenAccent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: !isMe ? Radius.circular(0) : Radius.circular(12),
              bottomRight: isMe ? Radius.circular(0) : Radius.circular(12),
            ),
          ),
          width: 140,
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16
          ),
          margin: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8,
          ),
          child: Column(
            crossAxisAlignment: isMe? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isMe ? Colors.black : Colors.pink,
                )

              ),
              Text(
                message
              ),
            ],
          )

        )

      ],

    );
  }
}
