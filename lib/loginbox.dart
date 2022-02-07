// ignore_for_file: unused_field, avoid_print, duplicate_ignore, prefer_const_constructors

import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:myapp/homescreen.dart';
import 'package:myapp/seconddetails.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum MobileVerificationState {
  // ignore: constant_identifier_names
  SHOW_MOBILE_FORM_STATE,
  // ignore: constant_identifier_names
  SHOW_OTP_FORM_STATE,
}

// ignore: use_key_in_widget_constructors
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  // late String pinAuth;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String uid = '';
  String finalEmail = '';
  late String verificationId;
  // ignore: prefer_typing_uninitialized_variables
  var _suid;
  late UserCredential authCredential;
  String? phoneNumber;

  Map? data;
  // ignore: prefer_typing_uninitialized_variables
  var _phone;
  // ignore: prefer_typing_uninitialized_variables
  var doc;
  // ignore: prefer_typing_uninitialized_variables
  var otp;
  bool userIsLoggedIn = false;
  // ignore: prefer_typing_uninitialized_variables
  var obtainedUrl;
  PhoneNumber number = PhoneNumber(isoCode: 'IN');
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool showLoading = false;

  // Future<void> _getdocId() async {
  //    var user =  _auth.currentUser!.uid.toString();
  //   print('user id 22222222 $user');

  //    QuerySnapshot doc = await  _firestore.collection('users').get();
  //   for (int i = 0; i < doc.docs.length; i++){
  //    var a = doc.docs[i].data();
  //   print(
  //       'this issssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss 1111111111111111111111111111111111 $a  ');
  //  } }

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);
      uid = (_auth.currentUser)!.uid;
      setState(() {
        showLoading = false;
      });
      try {
        await _firestore
            .collection('users')
            .doc(_auth.currentUser!.uid)
            .get()
            .then((value) {
          if (value.exists) {
            userIsLoggedIn = true;
          }
        });
      } catch (e) {
        print(e.toString());
      }

      // ignore: avoid_print
      print(
          'this is ssssssssssssssssssssssssssssssssss user is logged in $userIsLoggedIn');
      if (authCredential.user != null && userIsLoggedIn) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => DetailsScreen()));
      }
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Enter correct OTP"),
        ),
      );
      setState(() {
        showLoading = false;
      });

      // _scaffoldKey.currentState!
      // .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  getMobileFormWidget(context, size) {
    return AlertDialog(
      content: Column(
        children: [
          SizedBox(height: 20),
          SizedBox(
            height: 90,
            width: 230,
            child: Card(
              color: Colors.white,
              shadowColor: Colors.red,
              elevation: 50,
              clipBehavior: Clip.antiAlias,
              child: Text("Sign ",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.redAccent[700],
                      fontSize: 75,
                      fontWeight: FontWeight.w700)),
            ),
          ),
          SizedBox(
            height: 90,
            width: 230,
            // ignore: avoid_unnecessary_containers
            child: Container(
              child: Card(
                color: Colors.white,
                shadowColor: Colors.red,
                elevation: 50,
                child: Text("Up",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Colors.redAccent[700],
                        fontSize: 75,
                        fontWeight: FontWeight.w700)),
              ),
            ),
          ),
          SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.all(20),
            child: InternationalPhoneNumberInput(
              onInputChanged: (PhoneNumber number) async {
                phoneNumber = number.phoneNumber;
                final SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.setString(
                    'phoneNumber', phoneNumber.toString());
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
              initialValue: number,
              selectorTextStyle: const TextStyle(color: Colors.white),
              textFieldController: phoneController,
              formatInput: false,
              cursorColor: Colors.white,
              hintText: " Phone Number ",
              textStyle: TextStyle(color: Colors.white),
              inputDecoration: InputDecoration(
                alignLabelWithHint: true,
                labelText: "Enter Phone Number ",
                labelStyle: TextStyle(color: Colors.white70),
                fillColor: Colors.white,
                errorStyle: TextStyle(color: Colors.white70),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 1.0,
                  ),
                ),
              ),
              searchBoxDecoration: InputDecoration(
                labelText: "Enter Phone Number",
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.white,
                  width: 1.0,
                )),
              ),
              keyboardType: const TextInputType.numberWithOptions(
                  signed: true, decimal: true),
              onSaved: (PhoneNumber number) {
                // ignore: avoid_print
                print('On Saved: $number');
                setState(() async {});
              },
            ),
          ),
          SizedBox(height: 130),
          SizedBox(
            width: size.width * 0.7,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              onPressed: () async {
                setState(() {
                  showLoading = true;
                });

                await _auth.verifyPhoneNumber(
                  phoneNumber: phoneNumber.toString(),
                  verificationCompleted: (phoneAuthCredential) async {
                    setState(() {
                      showLoading = false;
                    });
                    signInWithPhoneAuthCredential(phoneAuthCredential);
                  },
                  verificationFailed: (verificationFailed) async {
                    setState(() {
                      showLoading = false;
                    });
                    // _scaffoldKey.currentState.showSnackBar(
                    // SnackBar(content: Text(verificationFailed.message)));
                  },
                  codeSent: (verificationId, resendingToken) async {
                    setState(() {
                      showLoading = false;
                      currentState =
                          MobileVerificationState.SHOW_OTP_FORM_STATE;
                      this.verificationId = verificationId;
                    });
                  },
                  codeAutoRetrievalTimeout: (verificationId) async {},
                );
              },
              child: const Text(
                "Get OTP",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }

  getOtpFormWidget(context, size) {
    return AlertDialog(
      // ignore: avoid_unnecessary_containers
      content: Container(
        child: Column(
          children: [
            const Spacer(
              flex: 2,
            ),
            Image.asset(
              'images/otp.jpg',
              scale: 2,
            ),
            const Spacer(
              flex: 4,
            ),
            Text(
              "Enter OTP sent to ",
              style: TextStyle(
                  fontSize: 26,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20),
            Text(
              " $phoneNumber",
              style: TextStyle(
                  fontSize: 27,
                  color: Colors.black,
                  fontWeight: FontWeight.w800),
            ),
            const Spacer(
              flex: 3,
            ),
            OTPTextField(
              textFieldAlignment: MainAxisAlignment.spaceAround,
              length: 6,
              width: MediaQuery.of(context).size.width,
              fieldStyle: FieldStyle.underline,
              fieldWidth: 40,
              style: TextStyle(
                color: Colors.red,
              ),
              onChanged: (pin) {
                // ignore: avoid_print
                print("Changed: " + pin);
              },
              onCompleted: (pin) {
                // ignore: avoid_print
                print("Completed: " + pin);
                otp = pin;
              },
            ),
            const SizedBox(
              height: 90,
            ),
            SizedBox(
              width: size.width * 0.8,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent[700],
                    onPrimary: Colors.white24,
                    shadowColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                onPressed: () async {
                  PhoneAuthCredential phoneAuthCredential =
                      PhoneAuthProvider.credential(
                          verificationId: verificationId, smsCode: otp);

                  signInWithPhoneAuthCredential(phoneAuthCredential);
                },
                child: const Text("VERIFY OTP",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      body: Container(
          child: showLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                  ? getMobileFormWidget(context, size)
                  : getOtpFormWidget(context, size)),
    ));
  }
}
