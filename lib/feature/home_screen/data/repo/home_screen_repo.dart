
import 'package:e_commerce/feature/home_screen/data/model/product_model.dart';

import '../../../../core/wep_services/firestore_services.dart';
import '../../../../core/wep_services/api_path.dart';

class HomeScreenRepo{
  final FirestoreServices firestoreServices;

  HomeScreenRepo(this.firestoreServices);

  Stream<List<Product>> salesProductsStream() => firestoreServices.collectionsStream(
    path: ApiPath.products(),
    builder: (data, documentId) => Product.fromMap(data!, documentId),
    queryBuilder: (query) => query.where('discountValue', isNotEqualTo: 0),
  );

  Stream<List<Product>> newProductsStream() => firestoreServices.collectionsStream(
    path: ApiPath.products(),
    builder: (data, documentId) => Product.fromMap(data!, documentId),
    queryBuilder: (query) => query.where('discountValue', isEqualTo: 0),
  );
}