import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';


import '../../../../core/utilities/error/failure.dart';
import '../../../../core/wep_services/auth_wep_services.dart';

class AuthRepo {
  final AuthWebServices authWepServices;

  AuthRepo(this.authWepServices);

  Future<Either<Failure,User?>> loginWithEmailAndPassword(String email, String password) async {
    try {
      return right(await authWepServices.loginWithEmailAndPassword(email, password));
    } catch (e) {
      if (e is FirebaseAuthException){
        return left(FirebaseAuthFailure.fromFirebaseAuthFailure(e));
      }
      else{
        return left(FirebaseAuthFailure(e.toString()));
      }
    }
  }

  Future<Either<Failure,User?>> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      return right(await authWepServices.signUpWithEmailAndPassword(email, password));
    } catch (e) {
      if (e is FirebaseAuthException){
        return left(FirebaseAuthFailure.fromFirebaseAuthFailure(e));
      }
      else{
        return left(FirebaseAuthFailure(e.toString()));
      }
    }
  }

  Future<Either<Failure,UserCredential?>> signInWithGoogle()async{
    try {
      return right(await authWepServices.signInWithGoogle());
    } catch (e) {
      print(e.toString());
      if (e is FirebaseAuthException){
        return left(FirebaseAuthFailure.fromFirebaseAuthFailure(e));
      }
      else{
        return left(FirebaseAuthFailure(e.toString()));
      }
    }
  }

  Future<void> logout() async {
    await authWepServices.logout();
  }
}
