import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class FirebaseAuthFailure extends Failure {
  FirebaseAuthFailure(super.message);

  factory FirebaseAuthFailure.fromFirebaseAuthFailure(FirebaseAuthException e) {
    if (e.code == 'network-request-failed') {
      return FirebaseAuthFailure('No Internet Connection');
    } else if (e.code == "wrong-password") {
      return FirebaseAuthFailure('Please Enter correct password');
    } else if (e.code == 'user-not-found') {
      return FirebaseAuthFailure('Email not found');
    } else if (e.code == 'too-many-requests') {
      return FirebaseAuthFailure('Too many attempts please try later');
    }  else if (e.code == 'unknown') {
      return FirebaseAuthFailure('Email and Password Fields are required');
    } else {
      return FirebaseAuthFailure(e.code);
    }
  }
}
