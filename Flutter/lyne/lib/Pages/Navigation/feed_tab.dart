import 'package:flutter/material.dart';
import 'package:lyne/Data/feed_item.dart';

class FeedTabWidget extends StatefulWidget {
  @override
  _FeedTabWidgetState createState() => _FeedTabWidgetState();
}

class _FeedTabWidgetState extends State<FeedTabWidget> {

  // Sample data
  List sampleData;
  List getSampleData() {
    return [
      Data(
        title: 'Looney\'s Pub',
        desc: '45 min wait',
        indicatorValue: 0.7,
      ),
      Data(
        title: 'RJ Bentley\'s',
        desc: '20 min wait',
        indicatorValue: 0.5,
      ),
      Data(
        title: 'Looney\'s Pub',
        desc: 'Long line',
        indicatorValue: 0.9,
      ),
      Data(
        title: 'Turf',
        desc: '30 min wait',
        indicatorValue: 0.65,
      ),
      Data(
        title: 'Cornerstone',
        desc: 'Long line',
        indicatorValue: 0.8,
      ),
      Data(
        title: 'The Rail Sports Bar',
        desc: 'No line',
        indicatorValue: 0.1,
      ),
      Data(
        title: 'Turf',
        desc: '35 min wait',
        indicatorValue: 0.75,
      ),
      Data(
        title: 'The Rail Sports Bar',
        desc: '5 min wait',
        indicatorValue: 0.15,
      ),
      Data(
        title: 'Turf',
        desc: 'Long line',
        indicatorValue: 0.85,
      ),
      Data(
        title: 'Cornerstone',
        desc: '30 min wait for upstairs',
        indicatorValue: 0.6,
      ),
    ];
  }

  @override
  void initState() {
    sampleData = getSampleData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // App bar
    final topAppBar = AppBar(
      title: Text('Feed'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.create),
          onPressed: () {},
        )
      ],
    );

    // List tile
    ListTile makeListTile(Data data) => ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.white24))),
        child: Icon(Icons.person, color: Colors.black),
      ),
      title: Text(
        data.title,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),

      subtitle: Row(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                child: LinearProgressIndicator(
                    backgroundColor: Colors.grey,
                    value: data.indicatorValue,
                    valueColor: AlwaysStoppedAnimation(Colors.green)),
              )
          ),
          Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(data.desc, style: TextStyle(color: Colors.black)),
              )
          )
        ],
      ),
    );

    // Item
    Card makeItem(Data data) => Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.white70),
        child: makeListTile(data),
      ),
    );

    // Body
    final makeBody = Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return makeItem(sampleData[index]);
        },
      ),
    );

    return Scaffold(
      appBar: topAppBar,
      body: makeBody,
    );
  }
}