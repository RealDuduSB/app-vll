import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sbs_app/model/text_composer.dart';

class ChatField extends StatefulWidget {
  final User user;

  const ChatField({Key key, this.user}) : super(key: key);
  @override
  _ChatFieldState createState() => _ChatFieldState();
}

class _ChatFieldState extends State<ChatField> {
  final GoogleSignIn googleSignIn = GoogleSignIn();


  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');

  void _sendMessage({String text, File img}) async {
    
    Map<String, dynamic> data = {};

    if (img != null) {
      UploadTask task = FirebaseStorage.instance
          .ref()
          .child(DateTime.now().millisecondsSinceEpoch.toString())
          .putFile(img);

      TaskSnapshot taskSnapshot = await task.whenComplete(() => null);
      String url = await taskSnapshot.ref.getDownloadURL();
      data['imgUrl'] = url;
    }

    if (text != null) data['text'] = text;

    messages.add(data);
  }

  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Olá"),
          elevation: 0,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('messages').snapshots(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                  default:
                    List<DocumentSnapshot> docs =
                        snapshot.data.docs.reversed.toList();

                    return ListView.builder(
                        itemCount: docs.length,
                        reverse: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(docs[index].get('text')),
                          );
                        });
                }
              },
            )),
            TextComposer(_sendMessage),
          ],
        ));
  }
}
