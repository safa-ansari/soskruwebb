import 'package:flutter/material.dart';

class Navigation_Bar extends StatelessWidget {
  
  const Navigation_Bar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        
        border: Border.all(
          color: Colors.black54,
          width: 10
        ),
        color: Colors.red[900] 
      ),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 40,
            width: 100,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              _NavBarItem('Episode'),
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
