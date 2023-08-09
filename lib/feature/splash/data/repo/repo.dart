
import 'package:e_commerce/core/wep_services/auth_wep_services.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SplashRepo{
 final AuthWebServices authWebServices;

  SplashRepo(this.authWebServices);

 Stream<User?> authStateChanges() {
   return authWebServices.authStateChanges();
 }
}