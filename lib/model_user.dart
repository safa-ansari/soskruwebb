import 'package:cloud_firestore/cloud_firestore.dart';

class OurUser {
  String? uId;
  String? email;
  String? phoneNumber;
  String? fullName;
  Timestamp? timestamp;
  String? profileImageUrl;
  String? defaultAddressId;
  String? defaultVehicleId;

  OurUser(
      {this.uId,
      this.email,
      this.phoneNumber,
      this.fullName,
      this.timestamp,
      this.profileImageUrl,
      this.defaultAddressId,
      this.defaultVehicleId});
}
