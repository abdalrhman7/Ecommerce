import 'package:e_commerce/feature/cart/data/model/cart_model.dart';

import '../../../../core/wep_services/api_path.dart';
import '../../../../core/wep_services/firebase_auth_services.dart';
import '../../../../core/wep_services/firestore_services.dart';

class CartRepo {
  final FirestoreServices firestoreServices;
  final FirebaseAuthServices firebaseAuthServices;

  CartRepo(this.firestoreServices, this.firebaseAuthServices);

  String get getCurrentUserUid => firebaseAuthServices.currentUser!.uid;

  Stream<List<CartModel>> getAllCartItems() =>
      firestoreServices.collectionsStream(
        path: ApiPath.myProductsCart(getCurrentUserUid),
        builder: (data, documentId) => CartModel.fromMap(data!, documentId),
      );


  Future<void> deleteItemFromCart(CartModel cartItem) async {
    await firestoreServices.deleteData(
        path: ApiPath.addToCart(getCurrentUserUid, cartItem.id));
  }
}
