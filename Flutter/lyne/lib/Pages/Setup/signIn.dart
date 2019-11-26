import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../home.dart';

class SignInPage extends StatefulWidget {
  @override
  SignInPageState createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text('Sign in'),
//      ),
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                transform: Matrix4.translationValues(0.0, 50.0, 0.0), // TODO: make sure this is the correct value
                child: Image.asset(
                  'assets/graphics/logo.png',
                )
            ),
            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return 'Please enter a valid email.';
                  }
                },
                onSaved: (input) => _email = input,
                decoration: InputDecoration(
                  labelText: 'Email',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  labelStyle: TextStyle(
                      color: Colors.grey
                  ),
                ),
                style: TextStyle(
                    color: Colors.grey
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextFormField(
                validator: (input) {
                  if (input.length < 6) {
                    return 'Password must be at least 6 characters long.';
                  }
                },
                onSaved: (input) => _password = input,
                decoration: InputDecoration(
                  labelText: 'Password',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  labelStyle: TextStyle(
                      color: Colors.grey
                  ),
                ),
                style: TextStyle(
                    color: Colors.grey
                ),
                obscureText: true,
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: ButtonTheme(
                    minWidth: 200.0,
                    height: 50.0,
                    child: RaisedButton(
                        onPressed: signIn,
                        child: Text('Sign in'),
                        textColor: Colors.white,
                        color: const Color(0xffeb5556),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0))))),
            Container(
                child: ButtonTheme(
                    minWidth: 200.0,
                    height: 50.0,
                    child: FlatButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: Text('Don\'t have an account?'),
                      color: Colors.white,
                      textColor: const Color(0xffeb5556),
                    )))
          ],
        ),
      ),
    );
  }

  Future<void> signIn() async {
    // Validate fields
    final formState = _formKey.currentState;
    if (formState.validate()) {
      // Connect to Firebase
      formState.save();
      try {
        FirebaseUser user = (await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password)).user;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home(user: user)));
      } catch (e) {
        print(e.message);
      }
    }
  }
}
