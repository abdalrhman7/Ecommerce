import '../../../../core/wep_services/api_path.dart';
import '../../../../core/wep_services/firebase_auth_services.dart';
import '../../../../core/wep_services/firestore_services.dart';
import '../../../cart/data/model/cart_model.dart';

import '../model/Product_details_model.dart';

class ProductDetailsRepo {
  final FirestoreServices firestoreServices;

  final FirebaseAuthServices authWebServices;

  ProductDetailsRepo(this.firestoreServices, this.authWebServices);

  String get getCurrentUserUid => authWebServices.currentUser!.uid;

  Future<void> addToCart(ProductModel product, String uid) async {
    return firestoreServices.setData(
      path: ApiPath.addToCart(uid, product.id),
      data: product.toMap(),
    );
  }

  Future<void> addToFavorite(ProductModel product, String uid) async {
    return firestoreServices.setData(
      path: ApiPath.addToFavorite(uid, product.id),
      data: product.toMap(),
    );
  }

  Future<void> deleteFromFavorite(ProductModel product, String uid) async {
    return firestoreServices.deleteData(
      path: ApiPath.addToFavorite(uid, product.id),
    );
  }


  Stream<List<FavoriteModel>> getIsFavorite(String uid , String docId) => firestoreServices.collectionsStream(
    path: ApiPath.getIsFavorite(uid , docId),
    builder: (data, documentId) => FavoriteModel.fromMap(data!, documentId),
  );

}
