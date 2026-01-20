import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService{
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthService({FirebaseAuth? firebaseAuth}):
      _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;


  Future<User> signUp({
    required String email,
    required String password,
  }) async{
    final UserCredential credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password
    );

    return credential.user!;
  }



  Future<User> login({
    required String email,
    required String password,
  }) async{
    final UserCredential credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password
    );

    return credential.user!;
  }



  Future<void> logout() async{
    await _firebaseAuth.signOut();
  }

  User? get currentUser => _firebaseAuth.currentUser;
}