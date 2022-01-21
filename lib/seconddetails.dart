import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/homescreen.dart';
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
      backgroundColor: Colors.white10,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Container(
             decoration: BoxDecoration(
        gradient: RadialGradient(colors: [ 
          Colors.white54,
        Colors.grey[200]!,
         Colors.white54,
          Colors.grey[200]!,
          Colors.white,
          Colors.white54,
          Colors.grey[200]!,
          Colors.white,
          Colors.white54,
          Colors.grey[200]!,
          Colors.white,
          Colors.white54,
          Colors.grey[200]!,
          Colors.white
          ])
      ),
        
            child: Column(
              children: [
              
              Navigation_Bar(),
               Container(
              decoration: BoxDecoration(
               image: DecorationImage(
                 image: AssetImage("images/mbg.jpg"),
                 fit: BoxFit.fitHeight,
               ),
              ),
              child: Padding(
                 padding: const EdgeInsets.fromLTRB(5, 10, 5, 50),
                 child: Form(
                   key: _formKey,
                   autovalidateMode: AutovalidateMode.onUserInteraction,
                   child: Column(
                       textDirection: TextDirection.ltr,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         Container(
                           decoration: BoxDecoration(
                             border: Border.all(
                               color: Colors.black
                             )
                           ),
                           child: Row(children: <Widget>[
                             Container(
                               child: Column(
                                 children: [
                                   Container(
                                     margin: const EdgeInsets.only(top: 25, left: 50),
                                     child: CircleAvatar(
                                       radius: 45,
                                       child: ClipOval(
                                         child: upfile != null
                                             ? Image.file(
                                                 upfile!,
                                                 height: 200,
                                                 width: 200,
                                                 fit: BoxFit.fill,
                                               )
                                             : Image.asset(
                                                 'images/userimage.jpg',
                                                 fit: BoxFit.fill,
                                               ),
                                       ),
                                     ),
                                   ),
                                   SizedBox(height: 20),
                                 ],
                               ),
                             ),
                             Padding(
                                 padding: EdgeInsets.all(0.0),
                                 child: Container(
                                     alignment: Alignment.center,
                                     child: Row(children: <Widget>[
                                       Padding(
                                         padding: const EdgeInsets.fromLTRB(
                                             80.0, 25, 0.0, 0.0),
                                         child: Column(
                                           children: [
                                             FloatingActionButton(
                                               child: Icon(
                                                 Icons.camera_outlined,
                                                 size: 24.0,
                                                 semanticLabel: 'Camera',
                                               ), //camera image
                                               backgroundColor: Colors.redAccent[700],
                                               onPressed: () async {
                                                 var imagePicker;
                                                 var file = await imagePicker.pickImage(
                                                     source: ImageSource.camera);
                                                 setState(() {
                                                   upfile = File(file!.path);
                                                 });
        
                                                 print(
                                                     'this issssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss $file');
                                               },
                                             ),
                                             SizedBox(height: 10),
                                             Text(
                                               "Camera",
                                               style: TextStyle(
                                                   fontSize: 10,
                                                   color: Colors.red[800]),
                                             )
                                           ],
                                         ),
                                       ),
                                       Padding(
                                         padding: const EdgeInsets.fromLTRB(
                                             30.0, 25, 0.0, 0.0),
                                         child: Column(
                                           children: [
                                             FloatingActionButton(
                                               onPressed: () async {
                                                 var imagePicker;
                                                 var file = await imagePicker.pickImage(
                                                     source: ImageSource.gallery);
                                                 setState(() {
                                                   upfile = File(file!.path);
                                                 });
        
                                                 print(
                                                     'this issssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss $file');
                                               },
                                               child: Icon(
                                                 Icons.add_photo_alternate_outlined,
                                                 size: 24.0,
                                                 semanticLabel: 'Gallery',
                                               ), //gallery image
                                               backgroundColor: Colors.redAccent[700],
                                             ),
                                             SizedBox(height: 10),
                                             Text(
                                               "Gallery",
                                               style: TextStyle(
                                                   fontSize: 10,
                                                   color: Colors.red[800]),
                                             ),
                                           ],
                                         ),
                                       ),
                                     ]
                                     )
                                     )
                                     ),
                           ]),
                         ),
                         SizedBox(height: 30),
                         //uploading to firebase
                         Container(
                             decoration: BoxDecoration(
        
        border: Border.all(
          color: Colors.black54,
          width: 10
        ),),
                           child: Column(
                             children: [
                               SizedBox(
                                 width: size.width * 0.5,
                                 height: 40,
                                 child: ElevatedButton(
                                   onPressed: () {
                                     uploadImage(uid);
                                   },
                                   child: Text(
                                     "Save Image ",
                                     style: TextStyle(color: Colors.white, fontSize: 16),
                                   ),
                                   style: ElevatedButton.styleFrom(
                                       primary: Colors.redAccent[700],
                                       onPrimary: Colors.black,
                                       shadowColor: Colors.red[200],
                                       shape: RoundedRectangleBorder(
                                           borderRadius: BorderRadius.circular(10)
                                           )
                                           ),
                                 ),
                               ),
                             
                           
                           Text("E-mail  ",
                               textAlign: TextAlign.start,
                               style: TextStyle(
                                 fontWeight: FontWeight.w800,
                                 letterSpacing: 1.0,
                                 height: 3,
                                 fontSize: 18,
                                 color: Colors.black,
                               )),
                           Padding(
                             padding: EdgeInsets.all(0.0),
                             child: defaultFormField(
                                
                                 label: 'Email',
                                 prefix: Icons.email,
                                 type: TextInputType.emailAddress,
                                 validate: (value) => emailValidator(value!)),
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
                               validate: (value) => requiredValidator(value!),
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
                         ),
                       ]),
                         
                        
                         SizedBox(height: 50),
                         Center(
                           child: Row(
                             children: [
                               SizedBox(width: 17),
                               SizedBox(
                                 width: size.width * 0.3,
                                 height: 50,
                                 child: ElevatedButton(
                                   onPressed: () async {
                                     
                                       
                                       Navigator.pushReplacement(
                                           context,
                                           MaterialPageRoute(
                                               builder: (context) =>
                                                   HomeScreen()));
                                     },
                                     
                                     
                                     
                                     
                           
                                    
                                     
                                   
                                   child: Text(
                                     "Continue ",
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
                               ),
                             ],
                           ),
                         ),
                       ]),
                 )),
            )
              ])
            ),
        ),
      )
        )
        ;
  }

  void setState(Null Function() param0) {}

  emailValidator(String s) {}

  requiredValidator(String s) {}
}

void uploadImage(uid) {
}

Widget defaultFormField({
  
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  bool isPassword = false,
  required String? Function(String?)? validate,
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
      validator: validate,
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

       