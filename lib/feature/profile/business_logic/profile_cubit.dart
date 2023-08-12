import 'package:bloc/bloc.dart';
import 'package:e_commerce/feature/profile/data/profile_repo.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';


part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());

  final ProfileRepo profileRepo;

  User? getProfileInfo(){
    return profileRepo.getProfileInfo();
  }

  Future<void> logout() async {
    emit(ProfileLogoutLoadingState());
    await profileRepo.logout();
    emit(ProfileLogoutSuccessState());
  }
}
