import 'package:e_commerce/core/wep_services/firebase_auth_services.dart';

class ProfileRepo{
 final AuthWebServices authWebServices;

  ProfileRepo(this.authWebServices);

 Future<void> logout() async{
   await authWebServices.logout();
 }

}