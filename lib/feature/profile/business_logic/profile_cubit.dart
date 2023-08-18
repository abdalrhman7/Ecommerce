import 'package:bloc/bloc.dart';
import 'package:e_commerce/feature/profile/data/profile_repo.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../auth/data/repo/auth_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.authRepo) : super(ProfileInitial());

  final AuthRepo authRepo;

  String? getProfileInfo() {
    return authRepo.getCurrentUser!.email;
  }

  Future<void> logout() async {
    emit(ProfileLogoutLoadingState());
    await authRepo.logout();
    emit(ProfileLogoutSuccessState());
  }
}
