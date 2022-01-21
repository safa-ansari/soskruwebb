import 'package:flutter/material.dart';

class Centered_View extends StatelessWidget {
  final Widget child;
  const Centered_View({
    Key? key, required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(colors: [ Colors.redAccent[700]!,
        Colors.deepOrangeAccent[700]!,
         Colors.deepOrange[800]!,
          Colors.red[900]!,
          Colors.deepOrangeAccent[700]!,
          Colors.red[800]!,
          Colors.deepOrangeAccent[700]!,
          Colors.red[700]!,
          Colors.deepOrangeAccent[700]!,
          Colors.red[900]!,
          Colors.redAccent[700]!,
          Colors.deepOrange[800]!,
          Colors.deepOrangeAccent[400]!,
          Colors.redAccent[700]!])
      ),
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1200),
        child: child,
      ),
    );
  }
}
