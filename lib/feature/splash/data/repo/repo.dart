
import 'package:e_commerce/core/wep_services/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SplashRepo{
 final FirebaseAuthServices authWebServices;

  SplashRepo(this.authWebServices);

 Stream<User?> authStateChanges() {
   return authWebServices.authStateChanges();
 }
}