import 'package:e_commerce/core/widget/CustomCircularProgressIndicator.dart';
import 'package:e_commerce/feature/favorite/business_logic/favorite_cubit.dart';
import 'package:e_commerce/feature/product_details/data/model/Product_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_value.dart';
import '../../../../core/constants/text_style.dart';
import '../../../../core/widget/search.dart';
import '../widget/favorite_list_item.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> dummyCategory = [
      'Summer',
      'T-Shirt',
      'Jacket',
      'Shirts',
      'Winter'
    ];
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchBarWidget(),
            SizedBox(height: AppSize.s20Height),
            Text(
              'Favorites',
              style: Style.textStyle28.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: AppSize.s16Height),
            Column(
              children: [
                SizedBox(
                  height: AppSize.s30Height,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: dummyCategory.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: AppPadding.p10),
                        child: Container(
                          height: AppSize.s30Height,
                          width: AppSize.s100Width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.black87,
                          ),
                          child: Center(
                              child: Text(dummyCategory[index],
                                  style: Style.textStyle16
                                      .copyWith(color: Colors.white))),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: AppSize.s16Height),
                Row(
                  children: [
                    const Icon(Icons.filter_list_outlined),
                    SizedBox(
                      width: AppSize.s8Width,
                    ),
                    Text(
                      'Filters',
                      style: Style.textStyle12,
                    ),
                    SizedBox(
                      width: AppSize.s50Width,
                    ),
                    const Icon(Icons.compare_arrows_outlined),
                    SizedBox(
                      width: AppSize.s8Width,
                    ),
                    Text(
                      'Price: Lowest to high',
                      style: Style.textStyle12,
                    ),
                    SizedBox(
                      width: AppSize.s50Width,
                    ),
                    const Icon(Icons.grid_view_rounded),
                  ],
                ),
                SizedBox(height: AppSize.s16Height),
                Column(
                  children: [
                    StreamBuilder<List<FavoriteModel>>(
                      stream: BlocProvider.of<FavoriteCubit>(context).getAllFavoriteItems(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.active) {
                          final favorites = snapshot.data;
                          if (favorites == null || snapshot.data!.isEmpty) {
                            return Center(child: Text('Add Product To Favorite' , style: Style.textStyle16),);
                          }
                          return SizedBox(
                            height: AppSize.s380Height,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: favorites.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return  FavoriteListItem(favorite:  favorites[index]);
                              },
                            ),
                          );
                        }
                        return const CustomCircularProgressIndicator();
                      }
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
