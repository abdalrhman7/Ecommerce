import 'package:bloc/bloc.dart';
import 'package:e_commerce/feature/product_details/data/repo/add_to_cart_repo.dart';
import 'package:meta/meta.dart';


import '../data/model/add_to_cart_model.dart';

part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit(this.addToCartRepo) : super(AddToCartInitial());

  final AddToCartRepo addToCartRepo;


  String get currentUserUid => addToCartRepo.getCurrentUserUid;

  Future<void> addToCart(AddToCartModel product) async {
    await addToCartRepo.addToCart(product, currentUserUid);
  }



}
