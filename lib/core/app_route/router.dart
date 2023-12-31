import 'package:e_commerce/core/app_route/routes.dart';
import 'package:e_commerce/feature/auth/business_logic/auth_cubit.dart';
import 'package:e_commerce/feature/auth/data/repo/auth_repo.dart';
import 'package:e_commerce/feature/auth/presentation/view/auth_screen.dart';
import 'package:e_commerce/feature/product_details/business_logic/product_details_cubit.dart';
import 'package:e_commerce/feature/product_details/data/repo/product_details_repo.dart';

import 'package:e_commerce/feature/splash/business_logic/splash_cubit.dart';
import 'package:e_commerce/feature/splash/data/repo/repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../feature/bottom_navbar/presentation/view/bottom_navbar.dart';
import '../../feature/product_details/presentation/view/product_details_screen.dart';
import '../../feature/splash/presentation/view/splash_screen.dart';
import '../../injection.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.authScreen:
      return MaterialPageRoute(
        builder: (_) =>
            BlocProvider<AuthCubit>(
              create: (context) => AuthCubit(getIt.get<AuthRepo>()),
              child: const AuthScreen(),
            ),
        settings: settings,
      );

    case AppRoutes.bottomNavBar:
      return MaterialPageRoute(
        builder: (_) =>
        const BottomNavbar(),
        settings: settings,
      );

    // case AppRoutes.homeScreen:
    //   return MaterialPageRoute(
    //     builder: (_) => const HomeScreen(),
    //     settings: settings,
    //   );

    // case AppRoutes.cartScreen:
    //   return MaterialPageRoute(
    //     builder: (_) => const CartScreen(),
    //     settings: settings,
    //   );

    // case AppRoutes.profileScreen:
    //   return MaterialPageRoute(
    //     builder: (_) =>
    //     const ProfileScreen(),
    //     settings: settings,
    //   );

    case AppRoutes.productDetails:
      final args = settings.arguments as Map<String, dynamic>;
      final product = args['product'];
      return MaterialPageRoute(
        builder: (_) =>
            BlocProvider(
              create: (context) => ProductDetailsCubit(getIt.get<ProductDetailsRepo>() , getIt.get<AuthRepo>()),
              child: ProductDetailsScreen(product: product),
            ),
        settings: settings,
      );

    default:
      return MaterialPageRoute(
        builder: (_) =>
            BlocProvider<SplashCubit>(
              create: (context) => SplashCubit(getIt.get<SplashRepo>()),
              child: const SplashView(),
            ),
        settings: settings,
      );
  }
}
