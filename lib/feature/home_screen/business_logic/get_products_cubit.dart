import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/model/product_model.dart';
import '../data/repo/home_screen_repo.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit(this.homeScreenRepo) : super(GetProductsInitial());
  final HomeScreenRepo homeScreenRepo;

  Stream<List<Product>> salesProductsStream() =>
      homeScreenRepo.salesProductsStream();

  Stream<List<Product>> newProductsStream() =>
      homeScreenRepo.newProductsStream();
}
