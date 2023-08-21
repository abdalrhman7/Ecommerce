import '../../../../core/wep_services/api_path.dart';
import '../../../../core/wep_services/firestore_services.dart';
import '../../../cart/data/model/cart_model.dart';

import '../model/Product_details_model.dart';

class ProductDetailsRepo {
  final FirestoreServices firestoreServices;

  ProductDetailsRepo(this.firestoreServices);


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


  Future<List<FavoriteModel>> getIsFavorite(String uid , String docId) => firestoreServices.getData(
    path: ApiPath.getIsFavorite(uid , docId),
    builder: (data, documentId) => FavoriteModel.fromMap(data!, documentId),
  );

}
