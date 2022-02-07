// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// ignore: avoid_web_libraries_in_flutter, unused_import
import 'dart:html';
import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:myapp/centered_view.dart';
import 'package:myapp/details.dart';
import 'package:myapp/navigation_bar.dart';
import 'package:myapp/seconddetails.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    var phoneController;
    // ignore: prefer_typing_uninitialized_variables
    var number;
    return Scaffold(
        body: SafeArea(
            child: Centered_View(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Row(children: <Widget>[
                Details(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "24 hr Doorstep Car and Bike repair/mechanic Service & Roadside assist near you in 30 min.",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Details(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Call Now/Book online . Get SOS Kru Emergency Service for Car and Bike due to Mechanical issues within 30-40 minutes for your Bikes & Cars from our experienced Mechanics",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Details(
                    child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Choose from the various automobile repair and roadside assistance services.',
                    style: TextStyle(fontSize: 20),
                  ),
                )),
                SizedBox(
                  width: 30,
                ),
                SizedBox(
                    height: 400,
                    width: 340,
                    child: Card(
                        child: Padding(
                            padding: const EdgeInsets.all(22.0),
                            child: Column(children: [
                              SizedBox(height: 30),
                              Text(
                                'SIGN UP / LOGIN ',
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.redAccent[700],
                                    fontWeight: FontWeight.w900),
                              ),
                              SizedBox(height: 20),
                              Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextFormField(
                                    
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                labelText: "Enter Email",
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2.0,
                  ),
                ),),
                                    
                                    
                                  )),
                              SizedBox(height: 10),
                              Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                labelText: "Enter Password",
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2.0,
                  ),
                ),),

                                  )),
                              SizedBox(height: 30),
                              SizedBox(
                                  width: 270,
                                  height: 40,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      onPrimary: Colors.red,
                                      shadowColor: Colors.black,
                                      onSurface: Colors.redAccent,
                                      elevation: 30,
                                      primary: Colors.redAccent[700],
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    onPressed: () async {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DetailsScreen(),
                                          ));
                                    },
                                    child: Text(" Login ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20
                                    ),),
                                  ))
                            ]))))
              ]),
            )
          ],
        ),
      ),
    )));
  }
}
