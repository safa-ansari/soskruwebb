// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';

// ignore: camel_case_types
class Navigation_Bar extends StatelessWidget {
  const Navigation_Bar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black54, width: 10),
          color: Colors.red[900]),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          // ignore: prefer_const_constructors
          SizedBox(
            height: 40,
            width: 100,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            // ignore: prefer_const_literals_to_create_immutables, duplicate_ignore, duplicate_ignore
            children: [
              // ignore: prefer_const_constructors
              _NavBarItem('Episode'),
              // ignore: prefer_const_constructors
              SizedBox(
                width: 60,
              ),
              _NavBarItem("About")
            ],
          )
        ],
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String title;
  const _NavBarItem(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 18),
    );
  }
}
