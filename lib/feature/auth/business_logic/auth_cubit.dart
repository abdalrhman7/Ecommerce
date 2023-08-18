import 'package:bloc/bloc.dart';
import 'package:e_commerce/feature/auth/data/repo/auth_repo.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';


part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepo authRepo;

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    emit(AuthLoadingState());
    var result = await authRepo.loginWithEmailAndPassword(email, password);
    result.fold((l) => emit(AuthFailureState(l.message)) , (r) => emit(AuthSuccessState()));
  }

  Future<void> signUpWithEmailAndPassword(
      String email, String password) async {
    emit(AuthLoadingState());
    var result = await authRepo.signUpWithEmailAndPassword(email, password);
    result.fold((l) => emit(AuthFailureState(l.message)) , (r) => emit(AuthSuccessState()));
  }

  Future<void> signInWithGoogle()async{
    emit(SignInWithGoogleLoadingState());
    var result = await authRepo.signInWithGoogle();
    result.fold((l) => emit(SignInWithGoogleFailureState(l.message)) , (r) => emit(SignInWithGoogleSuccessState()));
  }

  User? getCurrentUser(){
    return authRepo.getCurrentUser;
  }

  Future<void> logout() async {
    await authRepo.logout();
  }
}
