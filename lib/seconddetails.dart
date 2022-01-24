import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/homescreen.dart';
import 'package:myapp/model_user.dart';
import 'package:myapp/navigation_bar.dart';
import 'package:uuid/uuid.dart';

class DetailsScreen extends StatelessWidget {
  var uid;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var _formKey;
    var upfile;
    var emailController;
    var userName;
    var _labelController;
    var _line1Controller;
    var _line2Controller;
    var _cityController;
    var _pinCodeController;
    var _addtionalInfoCntroller;
    return Scaffold(
        backgroundColor: Colors.red[900],
        body: Padding(
            padding: const EdgeInsets.all(6.0),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xFFD50000),
                      width: 10

                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(60.0),
                    child: Container(
                        decoration: BoxDecoration(
gradient:RadialGradient(colors: [ 
  
        Colors.grey[50]!,
         Colors.grey[200]!,
         Colors.grey[50]!,
         Colors.grey[200]!,
         Colors.grey[50]!,
         Colors.grey[200]!,
         Colors.grey[50]!,
         Colors.grey[200]!,
         Colors.grey[50]!,
         Colors.grey[200]!,

         ]),
      
                    border: Border.all(
                      color: Colors.black,
                      width: 10

                    )
                  ),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.start,
                            children : [
                              Container(
                                child: Text("DETAILS",
                                 style: TextStyle(

                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1.0,
                                  height: 2,
                                    fontSize: 30,
                                    color: Colors.black,
                                  )
                                ),
                              ),
                              SizedBox(
                                height: 20
                              ),
                              const Text("E-mail  ",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 1.0,
                                    height: 3,
                                    fontSize: 18,
                                    color: Colors.black,
                                  )
                                  ),
                              Padding(
                                padding: EdgeInsets.all(0.0),
                                child: defaultFormField(
                                   
                                    label: 'Email',
                                    prefix: Icons.email,
                                    type: TextInputType.emailAddress,
                                  ),
                              ),

                              SizedBox(height: 0),
                              Text("Name",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 1.0,
                                    height: 3,
                                    fontSize: 18,
                                    color: Colors.black,
                                  )),
                              Padding(
                                padding: EdgeInsets.all(2.0),
                                child: defaultFormField(
                                  //username controller
                                  label: 'Full Name',
                                 
                                  prefix: Icons.person,
                                  type: TextInputType.name,
                                  
                                ),
                              ),
                              SizedBox(height: 0),
                               Text('Address',
                               textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 1.0,
                                    height: 3,
                                    fontSize: 18,
                                    color: Colors.black,)),
                                    SizedBox(height: 4,),
                              Column(
                children: [
                 
                        TextFormField(
                            controller: _labelController,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              labelText: 'Address Label*',
                              hintText: 'Ex : Home',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please fill this field";
                              }
                              return null;
                            }),
                        SizedBox(height: 20),
                        TextFormField(
                            controller: _line1Controller,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              labelText: 'Address Line 1*',
                              hintText: 'Flat Number, Building Name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please fill this field";
                              }
                              return null;
                            }),
                        SizedBox(height: 20),
                        TextFormField(
                            controller: _line2Controller,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              labelText: 'Address Line 2*',
                              hintText: 'Locality, Road name/Landmark',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please fill this field";
                              }
                              return null;
                            }),
                        SizedBox(height: 20),
                        TextFormField(
                            controller: _cityController,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              labelText: 'City*',
                              hintText: 'Ex : Banglore',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please fill this field";
                              }
                              return null;
                            }),
                        SizedBox(height: 20),
                        TextFormField(
                            controller: _pinCodeController,
                            keyboardType: TextInputType.number,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              labelText: 'Pin Code*',
                              hintText: 'Ex : 400004',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please fill this field";
                              }
                              return null;
                            }),
                            SizedBox(height: 20),
                            TextFormField(
                            controller: _addtionalInfoCntroller,
                            
                            decoration: InputDecoration(
                              labelText: 'Additional info',
                              hintText: 'Ex : Near orion mall',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            ),
                        SizedBox(height: 30),
                        
                ],
            ),
                              
                             
                              SizedBox(height: 50),
                              Center(
                                child: SizedBox(
                                  width: size.width * 0.7,
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        var addressId = Uuid().v4();
                                      
                                              
                                    
                                   
                                        
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeScreen()));
                                      }
                                    },
                                    child: Text(
                                      "Click Here To Continue ",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 19),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.redAccent[700],
                                        onPrimary: Colors.white24,
                                        shadowColor: Colors.red,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        )
                                        ),
                                  ),
                        )
                                  )
                            ]),
                      ),
                    ),
                  )
                            ),
              ))));
  }

  requiredValidator(String s) {}
}

emailValidator(String s) {
}
Widget defaultFormField({
  
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  bool isPassword = false,
 
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
}) =>
    TextFormField(
      
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: (s) {
        onSubmit!(s);
      },
      onChanged: (s) {
        onChange!(s);
      },
     
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  suffixPressed!();
                },
                icon: Icon(
                  suffix,
                ),
              )
            : null,
          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
      ),
    );