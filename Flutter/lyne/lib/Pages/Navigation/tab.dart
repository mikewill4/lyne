import 'package:flutter/material.dart';

class TabWidget extends StatelessWidget {
  final Color color;

  TabWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}