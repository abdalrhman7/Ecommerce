

import 'package:e_commerce/feature/product_details/data/model/Product_details_model.dart';

import '../../../../core/wep_services/api_path.dart';
import '../../../../core/wep_services/firebase_auth_services.dart';
import '../../../../core/wep_services/firestore_services.dart';

class FavoriteRepo{
  final FirestoreServices firestoreServices;
  //final FirebaseAuthServices firebaseAuthServices;

  FavoriteRepo(this.firestoreServices );

  //String get getCurrentUserUid => firebaseAuthServices.currentUser!.uid;

  Stream<List<FavoriteModel>> getAllFavoriteItems(String? uid) =>
      firestoreServices.collectionsStream(
        path: ApiPath.myFavorite(uid!),
        builder: (data, documentId) => FavoriteModel.fromMap(data!, documentId),
      );
}