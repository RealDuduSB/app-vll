import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  final User user;

  const UserPage({Key key, this.user}) : super(key: key);
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  _getCurrentUser() async {
    // ignore: await_only_futures
    final User user = await _auth.currentUser;
    final uid = user.uid;
    // Similarly we can get email as well
    //final uemail = user.email;
    print(uid);
    //print(uemail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Usuario" + widget.user.displayName),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              child: OutlinedButton(
            onPressed: () {
              _getCurrentUser();
            },
            child: Text('Details'),
          )),
        ]));
  }
}
