
import 'dart:io';

import 'package:chitchat/widgets/auth_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';




class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  var _isLoading = false;
 // String? message = 'An error occure, please check your credentials!';

  void _submitAuthForm(
      String email,
      String password,
      String username,
      File image,
      bool isLogin,
      BuildContext ctx,
      ) async {
    UserCredential authResult;


      try{
        setState(() {
          _isLoading = true;
        });
      if(isLogin){
       authResult = await  _auth.signInWithEmailAndPassword(
           email: email, password: password);
      } else{


        authResult = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        await FirebaseFirestore.instance.collection('users')
        .doc(authResult.user?.uid)
        .set({
            'username' : username,
            'email' : email,
          });

        }


        final ref = FirebaseStorage.instance
            .ref()
            .child('user_image')
         .child('${authResult.user?.uid}.jpg');
            //.child('NAFI.jpg');

        final UploadTask uploadTask =ref.putFile(image);

        final TaskSnapshot snapshot = await uploadTask;

        if (snapshot.state == TaskState.success) {
          final downloadUrl = await ref.getDownloadURL();
          print('Download URL: $downloadUrl');
        }
        else{
          print('Upload failed');
        }



      } on PlatformException catch (err){
      String? message1 = 'An error occure, please check your credentials!';
        print(err);
        print("hello hello");
        if(err.message != null){
          message1 = err.message;
        }
        //ScaffoldMessenger.of(ctx).clearSnackBars();
        ScaffoldMessenger.of(ctx).showSnackBar(
          const SnackBar(
            content: Text('Wrong Username or Password'),

          ),
        );
        setState(() {
          _isLoading = false;
        });
      }  catch (err){
          //String? message = err.;
        //var message;
        print(err.toString());
        String str = err.toString();
        String? restSubstring;
        int closingBracketIndex = str.indexOf("]");

        if (closingBracketIndex != -1) {
          // Extract the substring after the closing bracket
           restSubstring = str.substring(closingBracketIndex + 2); // +2 to skip the bracket and space
          print(restSubstring);
        }
        ScaffoldMessenger.of(ctx).showSnackBar(
          SnackBar(
            content: Text(restSubstring ?? 'Authentication failed.'),

          ),
        );


        setState(() {
          _isLoading = false;
        });

      }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(_isLoading,  _submitAuthForm),
    );
  }
}
