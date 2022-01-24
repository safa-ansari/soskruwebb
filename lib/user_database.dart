import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/model_user.dart';

class OurDatabse {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // late UserCredential authCredential;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future createUser(OurUser user) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid.toString())
          .set({
        'fullname': user.fullName,
        'email': user.email,
        'phone': user.phoneNumber,
        'default_address_id': user.defaultAddressId,
        'default_vehicle_id': user.defaultVehicleId,
        'userid': _auth.currentUser!.uid.toString(),
        'proflie_image_url': user.profileImageUrl,
      });
      retVal = "Success";
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return retVal;
  }
}
