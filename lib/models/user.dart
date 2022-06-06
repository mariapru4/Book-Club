import 'package:cloud_firestore/cloud_firestore.dart';

class OurUser {
  String? uid;
  String? email;
  String? fullName;
  Timestamp? accountCreated;
  String? groupId;

  OurUser({
    this.uid,
    this.email,
    this.fullName,
    this.accountCreated,
    this.groupId,
  });
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> updateUserData(Map<String, dynamic> values) async {
    String collection = 'users';
    String id = values['fullName'];
    await _firestore.collection(collection).doc(id).update(values);
  }
}
