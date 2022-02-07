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
                Navigation_Bar(),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                    child: Row(
                  children: <Widget>[
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
                        child: Column(
                          children: [
                            SizedBox(height: 30),
                            Text(
                              'SIGN UP / LOGIN ',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.redAccent[700],
                                  fontWeight: FontWeight.w900),
                            ),
                            SizedBox(height: 50),
                            Padding(
                              padding: const EdgeInsets.all(19.0),
                              child: InternationalPhoneNumberInput(
                                onInputChanged: (PhoneNumber number) async {
                                  // ignore: unused_local_variable
                                  var phoneNumber = number.phoneNumber;

                                  // ignore: avoid_print
                                  print(number.phoneNumber);
                                },
                                onInputValidated: (bool value) {
                                  // ignore: avoid_print
                                  print(value);
                                },
                                selectorConfig: const SelectorConfig(
                                  selectorType: PhoneInputSelectorType.DIALOG,
                                ),
                                ignoreBlank: false,
                                autoValidateMode:
                                    AutovalidateMode.onUserInteraction,
                                initialValue: number,
                                selectorTextStyle:
                                    const TextStyle(color: Colors.black),
                                textFieldController: phoneController,
                                formatInput: false,
                                cursorColor: Colors.black,
                                spaceBetweenSelectorAndTextField: 0.1,
                                hintText: " Phone Number ",
                                textStyle: TextStyle(color: Colors.black),
                                inputDecoration: InputDecoration(
                                  alignLabelWithHint: true,
                                  labelText: "Enter Phone Number ",
                                  labelStyle: TextStyle(color: Colors.black),
                                  fillColor: Colors.black,
                                  errorStyle: TextStyle(color: Colors.black),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                searchBoxDecoration: InputDecoration(
                                  labelText: "Enter Phone Number",
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 0.8,
                                  )),
                                ),
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        signed: true, decimal: true),
                              ),
                            ),
                            SizedBox(height: 70),
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
                                    )),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        // ignore: prefer_typing_uninitialized_variables
                                        var _formKey;
                                        return AlertDialog(
                                            content: Stack(children: <Widget>[
                                          Positioned(
                                            right: -40.0,
                                            top: -40.0,
                                            child: InkResponse(
                                              onTap: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: CircleAvatar(
                                                child: Icon(Icons.close),
                                                backgroundColor: Colors.red,
                                              ),
                                            ),
                                          ),
                                          Form(
                                            key: _formKey,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.all(6.0),
                                                  child: Text(
                                                    "Enter OTP ",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors
                                                            .redAccent[700]),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: TextFormField(),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            onPrimary:
                                                                Colors.red,
                                                            shadowColor:
                                                                Colors.black,
                                                            onSurface: Colors
                                                                .redAccent,
                                                            elevation: 30,
                                                            primary: Colors
                                                                .redAccent[700],
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            )),
                                                    child: Text(
                                                      "Continue",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    onPressed: () async {
                                                      Navigator.pushReplacement(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                DetailsScreen(),
                                                          ));
                                                      if (_formKey.currentState
                                                          .validate()) {
                                                        _formKey.currentState
                                                            .save();
                                                      }
                                                    },
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ]));
                                      });
                                },
                                child: const Text(
                                  "Get OTP",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white70),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
