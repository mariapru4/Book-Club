import 'package:book_reader/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OurDatabase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> createUser(OurUser user) async {
    String retVal = "error";

    try {
      await _firestore.collection("users").doc().set({
        'uid': user.uid,
        'fullName': user.fullName,
        'email': user.email,
        'accountCreated': Timestamp.now(),
        'groupId': user.groupId,
      });
      retVal = "success";
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<OurUser> getUserInfo(String uid) async {
    OurUser retVal = OurUser();
    try {
      DocumentSnapshot _doc =
          await _firestore.collection("users").doc(uid).get();
      retVal.uid = uid;
      retVal.fullName = _doc["fullName"];
      retVal.email = _doc["email"];
      retVal.accountCreated = _doc["accountCreated"];
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> createGroup(String groupName, String userUid) async {
    String retVal = "error";
    List<String> members = [];

    try {
      members.add(userUid);
      DocumentReference _docRef = await _firestore.collection("groups").add({
        'name': groupName,
        'leader': userUid,
        'members': members,
        'groupCreated': Timestamp.now()
      });

      FirebaseFirestore.instance
          .collection('users')
          .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((value) {
        value.docs.forEach((element) {
          print(element.id);
          _firestore.collection("users").doc(element.id).update({
            'groupId': _docRef.id,
          });
        });
      });

      retVal = "success";
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> joinGroup(String groupId, String? userUid) async {
    String retVal = "error";
    List<String> members = [];
    try {
      members.add(userUid!);
      await _firestore.collection("groups").doc(groupId).update({
        'members': FieldValue.arrayUnion(members),
      });
      FirebaseFirestore.instance
          .collection('users')
          .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((value) {
        value.docs.forEach((element) {
          print(element.id);
          _firestore
              .collection("users")
              .doc(element.id)
              .update({'groupId': groupId});
        });
      });

      retVal = "success";
    } catch (e) {
      print(e);
    }
    return retVal;
  }
}
