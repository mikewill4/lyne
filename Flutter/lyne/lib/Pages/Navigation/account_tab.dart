import 'package:flutter/material.dart';
import 'package:lyne/Pages/Setup/signIn.dart';

class AccountTabWidget extends StatefulWidget {
  @override
  _AccountTabWidgetState createState() => _AccountTabWidgetState();
}

class _AccountTabWidgetState extends State<AccountTabWidget> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return new Stack(children: <Widget>[
      new Container(color: Colors.white,),
      new Scaffold(
          appBar: new AppBar(
            title: new Text('Account'),
          ),
          backgroundColor: Colors.transparent,
          body: new Center(
            child: new Column(
              children: <Widget>[
                new SizedBox(height: _height/12,),
                new CircleAvatar(radius:_width<_height? _width/4:_height/4, backgroundImage: AssetImage('assets/graphics/user.png'),),
                new SizedBox(height: _height/25.0,),
                new Text('Test User', style: new TextStyle(fontWeight: FontWeight.bold, fontSize: _width/15, color: Colors.black),),
                new Padding(padding: new EdgeInsets.only(top: _height/30, left: _width/8, right: _width/8),
                  child:new Text('This is a sample bio.\nUsers can put whatever they \nwant here.',
                    style: new TextStyle(fontWeight: FontWeight.normal, fontSize: _width/25,color: Colors.black),textAlign: TextAlign.center,) ,),
                new Divider(height: _height/30,color: Colors.black,),
                new Row(
                  children: <Widget>[
                    rowCell(128, 'FRIENDS'),
                    rowCell(211, 'POSTS'),
                    rowCell(89, 'POINTS'),
                  ],),
                new Divider(height: _height/30,color: Colors.black),
                Container(
                    margin: const EdgeInsets.all(5.0),
                    child: ButtonTheme(
                        minWidth: 200.0,
                        height: 50.0,
                        child: RaisedButton(
                            onPressed: () {},
                            child: Text('Settings'),
                            textColor: Colors.white,
                            color: const Color(0xff1f1f1f),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)
                            )
                        )
                    )
                ),
                new Container(
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
              ],
            ),
          )
      )
    ],);
  }

  Widget rowCell(int count, String type) => new Expanded(child: new Column(children: <Widget>[
    new Text('$count',style: new TextStyle(color: Colors.black),),
    new Text(type,style: new TextStyle(color: Colors.black, fontWeight: FontWeight.normal))
  ],));

  void navigateToSignIn() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));
  }

}