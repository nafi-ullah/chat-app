import 'package:chitchat/widgets/chat/messages.dart';
import 'package:chitchat/widgets/chat/new_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal Communication"),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          DropdownButton(
              icon: const Icon(Icons.more_vert),
              items:const [
                DropdownMenuItem(
                    value: 'logout',
                    child: Row(
                      children: [
                        Icon(Icons.exit_to_app),
                        SizedBox(width: 8),
                        Text('Logout'),
                      ],
                    ),
                ),

              ],
              onChanged: (itemIdentiefier){
                if(itemIdentiefier == 'logout'){
                  FirebaseAuth.instance.signOut();
                }
              },)
        ],
      ),
      body:
      Container(
        child: const Column(
          children: [
            Expanded(child: Messages()),
            NewMessage(),
          ],
        ),
      ),

    );
  }
}
