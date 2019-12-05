import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lyne/Pages/Navigation/maps_tab.dart';
import 'package:lyne/Pages/Navigation/feed_tab.dart';
import 'package:lyne/Pages/Navigation/account_tab.dart';

class Home extends StatefulWidget {
  final FirebaseUser user;
  Home({Key key, this.user}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  // Bottom navigation bar
  int _currentIndex = 0;
  final List<Widget> _children = [
    MapsTabWidget(),
    FeedTabWidget(),
    AccountTabWidget()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        selectedItemColor: const Color(0xff1f1f1f),
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.chat_bubble),
            title: new Text('Feed'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            title: new Text('Account'),
          ),
        ]
      ),
//      body: StreamBuilder<DocumentSnapshot>(
//        stream: Firestore.instance.collection('users').document(user.uid).snapshots(),
//        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//          if (!snapshot.hasData) {
//            return Text('Loading...');
//          }
//          return Text('${snapshot.data['name']}');
//        },
//      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}