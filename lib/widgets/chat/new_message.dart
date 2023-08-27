import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {

  final _controller = TextEditingController();
  //late TextEditingController _controller;
  var _enteredMessage = '';
  void _sendMessage() async {
      FocusScope.of(context).unfocus();

      final user = await FirebaseAuth.instance.currentUser!;
      final userData = await FirebaseFirestore.instance.collection('users')
      .doc(user.uid).get();
      print(userData['username'].toString());

      FirebaseFirestore.instance.collection('chat').add({
        'text': _enteredMessage,
        'createdAt': Timestamp.now(),
        'userId': user.uid,
        'username': userData['username']

      });
    _controller.clear();

  }


  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(8),
      child:  Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Send a message...'),
              onChanged: (value){
                setState(() {
                  _enteredMessage = value ;
                });
              },
            ),
          ),
          IconButton(
            color: Theme.of(context).primaryColor,
            icon: const Icon(Icons.send),
            onPressed: _enteredMessage.trim().isEmpty ? null : _sendMessage,
          )
        ],
      )
    );
  }
}
