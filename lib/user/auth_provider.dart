import 'package:fireass/user/auth.dart';
import 'package:flutter/widgets.dart';

class AuthProvider extends InheritedWidget{
  AuthProvider({Key key,Widget child,this.auth}):super(key:key,child:child);
  final BaseAuth auth;
  @override
  bool updateShouldNotify(InheritedWidget oldWidget)=>true;

static AuthProvider of(BuildContext context){


  return(context.inheritFromWidgetOfExactType(AuthProvider) as AuthProvider);
}

}