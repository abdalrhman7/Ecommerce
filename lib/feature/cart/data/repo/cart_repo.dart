import 'package:e_commerce/feature/cart/data/model/cart_model.dart';

import '../../../../core/wep_services/api_path.dart';
import '../../../../core/wep_services/firebase_auth_services.dart';
import '../../../../core/wep_services/firestore_services.dart';

class CartRepo {
  final FirestoreServices firestoreServices;

  CartRepo(this.firestoreServices);

  Stream<List<CartModel>> getAllCartItems(String? uid) =>
      firestoreServices.collectionsStream(
        path: ApiPath.myProductsCart(uid!),
        builder: (data, documentId) => CartModel.fromMap(data!, documentId),
      );

  Future<void> deleteItemFromCart(ProductModel cartItem, String? uid) async {
    await firestoreServices.deleteData(
        path: ApiPath.addToCart(uid!, cartItem.id));
  }
}
