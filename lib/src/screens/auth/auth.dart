import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'An error occurred. Please try again later.';
      String error = _getErrorMessageFromFirebaseException(e);
      if (error == 'auth/user-not-found') {
        errorMessage = 'No user found with this email address.';
      } else if (error == 'auth/wrong-password') {
        errorMessage = 'Invalid password. Please try again.';
      }
      throw AuthException(errorMessage);
    }
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'An error occurred. Please try again later.';
      String error = _getErrorMessageFromFirebaseException(e);
      if (error == 'auth/weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (error == 'auth/email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
      } else if (error == 'auth/invalid-email') {
        errorMessage = 'Invalid email address.';
      }
      throw AuthException(errorMessage);
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  String _getErrorMessageFromFirebaseException(FirebaseAuthException e) {
    // Extract the error message from the Firebase exception message.
    final errorMessage = e.message;
    final startIndex = errorMessage!.indexOf('(');
    final endIndex = errorMessage.indexOf(')', startIndex + 1);

    if (startIndex != -1 && endIndex != -1) {
      return errorMessage.substring(startIndex + 1, endIndex);
    }

    return errorMessage;
  }
}

class AuthException implements Exception {
  final String message;

  AuthException(this.message);
}
