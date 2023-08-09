import 'package:bloc/bloc.dart';
import 'package:e_commerce/feature/splash/data/repo/repo.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';


part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this.splashRepo) : super(SplashInitial());
  final SplashRepo splashRepo;

  Stream<User?> authStateChanges() {
    return splashRepo.authStateChanges();
  }
}
