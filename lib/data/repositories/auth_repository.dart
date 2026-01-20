import 'package:firebase_auth/firebase_auth.dart';
import 'package:examplify/data/services/firebase_auth_service.dart';

class AuthRepository{
  final FirebaseAuthService _authService;

  AuthRepository({FirebaseAuthService? authService}):
      _authService = authService ?? FirebaseAuthService();


  Future<String> signUp({
    required String email,
    required String password
  }) async{
    try{
      final user = await _authService.signUp(
          email: email,
          password: password
      );
      return user.uid;
    }on FirebaseAuthException catch(e){
      throw _mapFirebaseException(e);
    }
  }



  Future<String> login({
    required String email,
    required String password,
  }) async{
    try{
      final user = await _authService.login(
        email: email,
        password: password
      );
      return user.uid;
    }on FirebaseAuthException catch(e){
      throw _mapFirebaseException(e);
    }
  }



  Future<void> logout() async{
    await _authService.logout();
  }

  bool get isLoggedIn => _authService.currentUser != null;

  Exception _mapFirebaseException(FirebaseAuthException e){
    switch(e.code){
      case 'email-already-in-use':
        return Exception('This email is already in registered.');
      case 'invalid-email':
        return Exception('Invalid email address.');
      case 'weak-password':
        return Exception('Password is too weak.');
      case 'user-not-found':
        return Exception('No account found with this email.');
      case 'wrong-password':
        return Exception('Incorrect password.');
      default:
        return Exception('Authentication failed. Please try again.');
    }
  }
}
