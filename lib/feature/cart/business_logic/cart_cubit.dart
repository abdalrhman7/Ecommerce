import 'package:bloc/bloc.dart';
import 'package:e_commerce/feature/cart/data/repo/cart_repo.dart';
import 'package:meta/meta.dart';

import '../data/model/cart_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInitial());

  final  CartRepo cartRepo;

  Stream<List<CartModel>> getAllCartItems() => cartRepo.getAllCartItems();

  Future<void> deleteItemFromCart(CartModel cartItem) async {
    await cartRepo.deleteItemFromCart(cartItem);
  }
}
