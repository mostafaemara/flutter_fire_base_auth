import 'package:fireass/user/auth_provider.dart';

import 'auth.dart';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
 

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

enum FormType { login, register }

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  FormType _formType = FormType.login;
  void moveToLogin() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void moveToRegister() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        setState(() {
          _isLoading = true;
        });
        var auth = AuthProvider.of(context).auth;
        if (_formType == FormType.login) {
          String userId =
              await auth.signInWithEmailAndPassword(_email, _password);
          setState(() {
            _isLoading = false;
          });

          print("sign in:${userId}");
        } else {
          String userId =
              await auth.createUserWithEmailAndPassword(_email, _password);
          print("sign in:${userId}");
        }
  
      } catch (e) {
        print("Error $e");
      }
    }
  }

  String _email;
  String _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          "LoginPage",
        ),
      ),
      body: Container(padding: EdgeInsets.all(20), child: checkIfloading()),
    );
  }

  List<Widget> buildInputs() {
    return [
      TextFormField(
        
        decoration: new InputDecoration(
          labelText: "Email",
          icon: Icon(Icons.email)
          ),
        validator:EmailFieldValidator.validate,
        onSaved: (value) => _email = value,
      ),
      TextFormField(
        decoration: InputDecoration(
          labelText: "Password",
          icon: Icon(Icons.lock)
          ),
        obscureText: true,
        validator: PasswordFieldValidator.validate,
        onSaved: (value) => _password = value,
      ),
    ];
  }

  List<Widget> buildSubmitButtons() {
    if (_formType == FormType.login) {
      return [
        RaisedButton(
          onPressed: validateAndSubmit,
          child: Text(
            "Login",
            style: TextStyle(fontSize: 20),
          ),
        ),
        FlatButton(
          child: Text(
            "Create an account",
            style: TextStyle(fontSize: 20),
          ),
          onPressed: moveToRegister,
        ),
      ];
    } else {
      return [
        

        RaisedButton(
          onPressed: validateAndSubmit,
          child: Text(
            "Creat Account",
            style: TextStyle(fontSize: 20),
          ),
        ),
        FlatButton(
          child: Text(
            "have an account? Login",
            style: TextStyle(fontSize: 20),
          ),
          onPressed: moveToLogin,
        ),
      ];
    }
  }

  Widget checkIfloading() {
    if (_isLoading) {
      return Container(
        alignment: Alignment.center,
        child:
        Center(
          child: 
         Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[CircularProgressIndicator( ), Text("Loading...")],
        ),
      ),);
    } else {
      return Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: buildInputs() + buildSubmitButtons(),
        ),
      );
    }
  }
}

class EmailFieldValidator{

static String validate(String value){
 

  if (value.isEmpty) {
    return "Email can\'t be empty";
  } else {
    return null;
  }
}
}


class PasswordFieldValidator{

static String validate(String value){
 

  if (value.isEmpty) {
    return "Password can\'t be empty";
  } else {
    return null;
  }
}
}