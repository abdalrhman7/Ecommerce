import '../../../../core/wep_services/api_path.dart';
import '../../../../core/wep_services/firebase_auth_services.dart';
import '../../../../core/wep_services/firestore_services.dart';
import '../model/add_to_cart_model.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AddToCartRepo{
  final FirestoreServices firestoreServices;

 final  FirebaseAuthServices authWebServices ;

  AddToCartRepo(this.firestoreServices , this.authWebServices);


  Future<void> addToCart(AddToCartModel product , String uid) async {
    return firestoreServices.setData(
      path: ApiPath.addToCart(uid, product.id),
      data: product.toMap(),
    );
  }

  String get getCurrentUserUid => authWebServices.currentUser!.uid;
}