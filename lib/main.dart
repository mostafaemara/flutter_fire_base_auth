import 'package:fireass/user/auth.dart';
import 'package:fireass/user/auth_provider.dart';
import 'package:fireass/user/root_page.dart';
import 'package:flutter/material.dart';

import 'user/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AuthProvider(
      auth: Auth(),

    
      child:MaterialApp(
        title: "Firebase Auth",
        theme: ThemeData(
          primarySwatch: Colors.purple
        ),
        home: RootPage() ,
      )
     
    );
  }
}
