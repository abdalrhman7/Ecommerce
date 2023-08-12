import 'package:e_commerce/core/wep_services/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ProfileRepo{
 final FirebaseAuthServices authWebServices;

  ProfileRepo(this.authWebServices);


  User? getProfileInfo(){
  return authWebServices.currentUser;
  }

 Future<void> logout() async{
   await authWebServices.logout();
 }

}