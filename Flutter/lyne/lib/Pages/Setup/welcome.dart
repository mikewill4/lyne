import 'package:lyne/Pages/Setup/register.dart';
import 'package:lyne/Pages/Setup/signIn.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(child: Container(),),
          Image.asset(
            'assets/graphics/Lyne_Logo_Light_Theme.png',
          ),
          Container(
              margin: const EdgeInsets.all(5.0),
              child: ButtonTheme(
                  minWidth: 200.0,
                  height: 50.0,
                  child: RaisedButton(
                      onPressed: navigateToSignIn,
                      child: Text('Sign in'),
                      textColor: Colors.white,
                      color: const Color(0xff1f1f1f),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)
                      )
                  )
              )
          ),
          Container(
              margin: const EdgeInsets.all(5.0),
              child: ButtonTheme(
                  minWidth: 200.0,
                  height: 50.0,
                  child: RaisedButton(
                      onPressed: navigateToRegister,
                      child: Text('Register'),
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

  void navigateToRegister() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
  }
}