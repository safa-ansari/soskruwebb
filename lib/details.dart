// ignore: avoid_web_libraries_in_flutter, unused_import
import 'dart:html';

import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final Widget child;
  const Details({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var child2 = child;
    return SizedBox(
      width: 250,
      height: 400,
      child: Card(
        color: Colors.orange[50],
        elevation: 40,
        shadowColor: Colors.black,
        child: Column(
          children: [
            // ignore: prefer_const_constructors
            SizedBox(
              height: 60,
            ),
            child,
          ],
        ),
      ),
    );
  }
}
