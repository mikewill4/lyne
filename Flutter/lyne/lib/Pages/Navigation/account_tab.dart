import 'package:flutter/material.dart';
import 'package:lyne/Pages/Setup/signIn.dart';

class AccountTabWidget extends StatefulWidget {
  @override
  _AccountTabWidgetState createState() => _AccountTabWidgetState();
}

class _AccountTabWidgetState extends State<AccountTabWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(child: Container(),),
          Text('Name:'),
          Text('Email:'),
          Container(
              margin: const EdgeInsets.all(5.0),
              child: ButtonTheme(
                  minWidth: 200.0,
                  height: 50.0,
                  child: RaisedButton(
                      onPressed: navigateToSignIn,
                      child: Text('Sign out'),
                      textColor: Colors.white,
                      color: const Color(0xff1f1f1f),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)
                      )
                  )
              )
          ),
          new Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }

  void navigateToSignIn() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));
  }

}