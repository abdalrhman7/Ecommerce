import 'package:e_commerce/feature/bottom_navbar/presentation/view/bottom_navbar.dart';
import 'package:e_commerce/feature/splash/business_logic/splash_cubit.dart';
import 'package:e_commerce/feature/splash/presentation/view/widget/sliding_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../injection.dart';
import '../../../../auth/business_logic/auth_cubit.dart';
import '../../../../auth/data/repo/auth_repo.dart';
import '../../../../auth/presentation/view/auth_screen.dart';


class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(animationController);

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: BlocProvider.of<SplashCubit>(context).authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final user = snapshot.data?.email;
            if (user == null) {
              return navigateToAuthScreen();
            } else {
              return   navigateToBottomNavBar();
            }
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SlidingText(slidingAnimation: slidingAnimation),
            ],
          );
        });
  }

  Widget navigateToAuthScreen() {
    Future.delayed(
      const Duration(seconds: 2),
    );
    return BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(getIt.get<AuthRepo>()),
      child: const AuthScreen(),
    );
  }

  Widget navigateToBottomNavBar() {
    Future.delayed(
      const Duration(seconds: 2),
    );
    return const BottomNavbar();
  }
}
