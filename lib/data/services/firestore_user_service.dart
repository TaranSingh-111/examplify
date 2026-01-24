import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreUserService{
  final FirebaseFirestore _firestore;

  FirestoreUserService({FirebaseFirestore? firestore}):
      _firestore = firestore ?? FirebaseFirestore.instance;

  Future<void> createUserProfile({
    required String uid,
    required String name,
    required String email,
    required int studentNo,
    required String branch,
    required String section,
    required int year,
}) async{
    await _firestore.collection('users').doc(uid).set({
      'name': name,
      'email': email,
      'studentNo': studentNo,
      'branch': branch,
      'section': section,
      'year': year,
      'createdAt': FieldValue.serverTimestamp()
    });
  }
}