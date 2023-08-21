import 'package:bloc/bloc.dart';
import 'package:e_commerce/feature/cart/data/model/cart_model.dart';
import 'package:e_commerce/feature/product_details/data/repo/product_details_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../auth/data/repo/auth_repo.dart';
import '../data/model/Product_details_model.dart';

part 'add_to_cart_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this.addToCartRepo, this.authRepo)
      : super(AddToCartInitial());

  final ProductDetailsRepo addToCartRepo;
  final AuthRepo authRepo;

  late String currentUserUid = authRepo.getCurrentUser!.uid;

  Future<void> addToCart(ProductModel product) async {
    await addToCartRepo.addToCart(product, currentUserUid);
  }

  Future<void> addToFavorite(ProductModel product) async {
    await addToCartRepo.addToFavorite(product, currentUserUid);
  }

  Future<void> deleteFromFavorite(ProductModel product) async {
    await addToCartRepo.deleteFromFavorite(product, currentUserUid);
  }

  Future<List<FavoriteModel>> getIsFavorite(String docId) {
    return addToCartRepo.getIsFavorite(currentUserUid , docId);
  }
}
