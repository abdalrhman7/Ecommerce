import 'package:bloc/bloc.dart';
import 'package:e_commerce/feature/auth/data/repo/auth_repo.dart';
import 'package:meta/meta.dart';

import '../../product_details/data/model/Product_details_model.dart';
import '../data/favorite_repo/favorite_repo.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.favoriteRepo, this.authRepo) : super(FavoriteInitial());

  final FavoriteRepo favoriteRepo;
  final AuthRepo authRepo;

  Stream<List<FavoriteModel>> getAllFavoriteItems() =>
      favoriteRepo.getAllFavoriteItems(authRepo.getCurrentUser!.uid);
}
