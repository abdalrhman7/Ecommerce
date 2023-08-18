import 'package:bloc/bloc.dart';
import 'package:e_commerce/feature/auth/business_logic/auth_cubit.dart';
import 'package:e_commerce/feature/auth/data/repo/auth_repo.dart';
import 'package:e_commerce/feature/cart/data/repo/cart_repo.dart';
import 'package:meta/meta.dart';

import '../data/model/cart_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo, this.authRepo) : super(CartInitial());

  final  CartRepo cartRepo;
  final AuthRepo authRepo;

  Stream<List<CartModel>> getAllCartItems() => cartRepo.getAllCartItems(authRepo.getCurrentUser!.uid);

  Future<void> deleteItemFromCart(ProductModel cartItem) async {
    await cartRepo.deleteItemFromCart(cartItem , authRepo.getCurrentUser!.uid);
  }
}
