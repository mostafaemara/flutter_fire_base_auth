import 'package:fireass/user/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import 'auth.dart';

class HomePage extends StatelessWidget {
 

  void _signOut(BuildContext context) async {
    try {
      var auth= AuthProvider.of(context).auth;
      await auth.signOut();
 
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.teal,
        actions: <Widget>[
          FlatButton(
            child: Text("Sign Out",style:TextStyle(fontSize:17,color: Colors.black)),
            onPressed:()=>_signOut(context),
          )
        ],
      ),
      body: Container(
        child: Center(
          child: Text("Welcom"),
        ),
      ),
    );
  }
}
