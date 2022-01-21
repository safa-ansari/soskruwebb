import 'dart:html';

import 'package:flutter/material.dart';
import 'package:myapp/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Flutter Demo",
    

      home: HomeView()
    );
  }
}
