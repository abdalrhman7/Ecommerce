import 'package:bloc/bloc.dart';
import 'package:e_commerce/feature/cart/data/model/cart_model.dart';
import 'package:e_commerce/feature/product_details/data/repo/add_to_cart_repo.dart';
import 'package:meta/meta.dart';



part 'add_to_cart_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this.addToCartRepo) : super(AddToCartInitial());

  final ProductDetailsRepo addToCartRepo;


  String get currentUserUid => addToCartRepo.getCurrentUserUid;

  Future<void> addToCart(ProductModel product) async {
    await addToCartRepo.addToCart(product, currentUserUid);
  }

  Future<void> addToFavorite(ProductModel product) async {
    await addToCartRepo.addToFavorite(product, currentUserUid);
  }

  Future<void> deleteFromFavorite(ProductModel product) async {
    await addToCartRepo.deleteFromFavorite(product, currentUserUid);
  }

  // Stream<List<AddToFavoriteModel>> getIsFavorite(String docId) {
  //   return addToCartRepo.getIsFavorite(currentUserUid , docId);
  // }






}
