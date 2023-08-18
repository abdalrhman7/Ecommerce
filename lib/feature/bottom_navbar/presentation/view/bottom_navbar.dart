import 'package:e_commerce/feature/auth/data/repo/auth_repo.dart';
import 'package:e_commerce/feature/cart/business_logic/cart_cubit.dart';
import 'package:e_commerce/feature/cart/data/repo/cart_repo.dart';
import 'package:e_commerce/feature/favorite/business_logic/favorite_cubit.dart';
import 'package:e_commerce/feature/favorite/data/favorite_repo/favorite_repo.dart';
import 'package:e_commerce/feature/home_screen/business_logic/get_products_cubit.dart';
import 'package:e_commerce/feature/home_screen/data/repo/home_screen_repo.dart';
import 'package:e_commerce/feature/profile/presentation/view/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection.dart';
import '../../../cart/presentation/view/cart_screen.dart';
import '../../../favorite/presentation/view/favorite_screen.dart';
import '../../../home_screen/presentation/view/home_screen.dart';
import '../../../profile/business_logic/profile_cubit.dart';
import '../../../profile/data/profile_repo.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  final _bottomNavbarController = PersistentTabController();

  List<Widget> _buildScreens() {
    return [
      blocProviderHomeScreen(),
      blocProviderCartScreen(),
      blocProviderFavoriteScreen(),
      blocProviderProfileScreen(),
    ];
  }

  BlocProvider<FavoriteCubit> blocProviderFavoriteScreen() {
    return BlocProvider(
      create: (context) => FavoriteCubit(getIt.get<FavoriteRepo>() , getIt.get<AuthRepo>() ),
      child: const FavoriteScreen(),
    );
  }

  Widget blocProviderCartScreen() {
    return BlocProvider<CartCubit>(
      create: (context) => CartCubit(getIt.get<CartRepo>() , getIt.get<AuthRepo>()),
      child: const CartScreen(),
    );
  }

  Widget blocProviderHomeScreen() {
    return BlocProvider<GetProductsCubit>(
      create: (context) => GetProductsCubit(getIt.get<HomeScreenRepo>()),
      child: const HomeScreen(),
    );
  }

  Widget blocProviderProfileScreen() {
    return BlocProvider<ProfileCubit>(
      create: (context) => ProfileCubit(getIt.get<AuthRepo>()),
      child: const ProfileScreen(),
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.destructiveRed,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.shopping_cart),
        title: ("Cart"),
        activeColorPrimary: CupertinoColors.destructiveRed,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite_border),
        title: ("Favorite"),
        activeColorPrimary: CupertinoColors.destructiveRed,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.profile_circled),
        title: ("Profile"),
        activeColorPrimary: CupertinoColors.destructiveRed,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  PersistentTabView _persistentTabView() {
    return PersistentTabView(
      context,
      controller: _bottomNavbarController,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _persistentTabView(),
    );
  }
}
