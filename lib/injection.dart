import 'package:e_commerce/feature/auth/business_logic/auth_cubit.dart';
import 'package:e_commerce/feature/splash/business_logic/splash_cubit.dart';
import 'package:get_it/get_it.dart';

import 'core/wep_services/FirestoreServices.dart';
import 'core/wep_services/firebase_auth_services.dart';
import 'feature/auth/data/repo/auth_repo.dart';
import 'feature/home_screen/business_logic/get_products_cubit.dart';
import 'feature/home_screen/data/repo/home_screen_repo.dart';
import 'feature/profile/business_logic/profile_cubit.dart';
import 'feature/profile/data/profile_repo.dart';
import 'feature/splash/data/repo/repo.dart';


final getIt = GetIt.instance;

void initGetIt() {

  ///

  ///Bloc
  getIt
      .registerLazySingleton<AuthCubit>(() => AuthCubit(getIt()));
  getIt
      .registerLazySingleton<SplashCubit>(() => SplashCubit(getIt()));
  getIt
      .registerLazySingleton<ProfileCubit>(() => ProfileCubit(getIt()));
  getIt
      .registerLazySingleton<GetProductsCubit>(() => GetProductsCubit(getIt()));

  ///Repo
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo(getIt()));
  getIt.registerLazySingleton<SplashRepo>(() => SplashRepo(getIt()));
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo(getIt()));
  getIt.registerLazySingleton<HomeScreenRepo>(() => HomeScreenRepo(getIt()));

  ///Wep_Services
  getIt.registerLazySingleton<AuthWebServices>(
          () => AuthWebServices());

  getIt.registerLazySingleton<FirestoreServices>(
          () => FirestoreServices());
}
