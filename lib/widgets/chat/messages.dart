import 'package:chitchat/widgets/chat/message_bubble.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Messages extends StatelessWidget {
  const Messages({super.key});


  @override
  Widget build(BuildContext context) {
    //late Future  user;
    //user = FirebaseAuth.instance.currentUser as Future;


    return FutureBuilder(

        future: fetchData(),
        builder: (ctx, futureSnapshot){
          if(futureSnapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator()
            );
          }
         return StreamBuilder(
              stream: FirebaseFirestore.instance.collection('chat').
              orderBy(
                'createdAt',
                descending: false,
              )
                  .snapshots(),
              builder: (ctx, chatSnapshot){
                if(chatSnapshot.connectionState == ConnectionState.waiting){
                  return const Center(child: CircularProgressIndicator(),);
                }
                final chatDocs = chatSnapshot.data?.docs;
                return ListView.builder(
                  itemCount: chatDocs?.length,
                  itemBuilder: (ctx, index) => MessageBubble(
                    chatDocs?[index]['text'],
                    chatDocs?[index]['userId'] == futureSnapshot.data?.uid,
                  ),
                );

              }
              );
        }

    );
  }
  Future<User?> fetchData() async {
    //await Future.delayed(Duration(seconds: 2)); // Simulating a delay
    return FirebaseAuth.instance.currentUser;
  }

}
