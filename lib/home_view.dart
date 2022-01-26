// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:html';
import 'dart:ui';

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
                          style: TextStyle(
                            fontSize: 20
                          ),
                        ),
                      ),
                    ),
                    Details(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "Call Now/Book online . Get SOS Kru Emergency Service for Car and Bike due to Mechanical issues within 30-40 minutes for your Bikes & Cars from our experienced Mechanics",
                         style: TextStyle(
                            fontSize: 20
                          ),),
                      ),
                    ),
                    Details(
                        child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Choose from the various automobile repair and roadside assistance services.',
                       style: TextStyle(
                            fontSize: 20
                          ),),
                    )
                    ),
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
                                fontWeight: FontWeight.w900
                              ),
                            ),
                            SizedBox(height: 50),
                             
                          
                            
              
                             Padding(
                               padding: const EdgeInsets.all(19.0),
                               child: InternationalPhoneNumberInput(
                                                onInputChanged: (PhoneNumber number) async {
                                                    var phoneNumber = number.phoneNumber;
                                                   
                                                    
                                                    print(number.phoneNumber);
                                                },
                                                onInputValidated: (bool value) {
                                                    print(value);
                                                },
                                                selectorConfig: const SelectorConfig(
                                                    selectorType: PhoneInputSelectorType.DIALOG,
                                                ),
                                                ignoreBlank: false,
                                                autoValidateMode: AutovalidateMode.onUserInteraction,
                                               
                                                selectorTextStyle: const TextStyle(color: Colors.black),
                                                
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
                                                keyboardType: const TextInputType.numberWithOptions(
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
                    )
                    ),
              
                
                

                                  onPressed: () async {
                                           Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => DetailsScreen(),
                                                ));
                                   
                                    
                                  
                                   }, child: null, ),
                              )
                            ],
                          ),
                        ),
                       ))]
                        )
                        )
                        
              ])))));}
                       

                }
                
                 
   