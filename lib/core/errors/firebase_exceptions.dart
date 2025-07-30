import 'package:firebase_auth/firebase_auth.dart';

String mapFirebaseAuthException(FirebaseAuthException e) {
  switch (e.code) {
    case 'invalid-email':
      return 'The email address is not valid.';
    case 'user-disabled':
      return 'This account has been disabled.';
    case 'user-not-found':
      return 'No user found with this email.';
    case 'wrong-password':
      return 'Incorrect password.';
    case 'email-already-in-use':
      return 'This email is already in use.';
    case 'weak-password':
      return 'The password is too weak.';
    case 'operation-not-allowed':
      return 'This operation is not allowed.';
    case 'network-request-failed':
      return 'Network error. Please check your connection.';
    default:
      return 'Authentication failed: ${e.message}';
  }
}
