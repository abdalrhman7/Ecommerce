import 'package:e_commerce/core/constants/app_assets.dart';
import 'package:e_commerce/core/constants/app_strings.dart';
import 'package:e_commerce/core/constants/app_value.dart';
import 'package:e_commerce/core/constants/text_style.dart';
import 'package:e_commerce/core/widget/CustomCircularProgressIndicator.dart';
import 'package:e_commerce/feature/home_screen/business_logic/get_products_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

import '../../data/model/product_model.dart';
import '../widget/List_item_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                height: .30.sh,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    image: NetworkImage(
                      AppAssets.topBannerHomePageAssets,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: AppPadding.p14, bottom: AppPadding.p18),
                child: Text(
                  AppStrings.streetClothes,
                  style: Style.textStyle34.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(height: AppSize.s25Height),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p8),
            child: Column(
              children: [
                buildSaleWidget(AppStrings.sale, AppStrings.superSummerSale),
                SizedBox(height: AppSize.s10Height),
                StreamBuilder<List<Product>>(
                    stream: BlocProvider.of<GetProductsCubit>(context)
                        .salesProductsStream(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active) {
                        final products = snapshot.data;
                        if (products == null || products.isEmpty) {
                          return const Center(
                            child: Text(AppStrings.noDataAvailable),
                          );
                        }
                        return SizedBox(
                          height: 275.h,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.all(AppPadding.p8),
                                child: ListItemHome(
                                    product: products[index], isNew: false),
                              );
                            },
                          ),
                        );
                      }
                      return const CustomCircularProgressIndicator();
                    }),
                buildSaleWidget(AppStrings.news, AppStrings.newProducts),
                SizedBox(height: AppSize.s10Height),
                StreamBuilder<List<Product>>(
                    stream: BlocProvider.of<GetProductsCubit>(context)
                        .newProductsStream(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active) {
                        final products = snapshot.data;
                        if (products == null || products.isEmpty) {
                          return const Center(
                            child: Text(AppStrings.noDataAvailable),
                          );
                        }
                        return SizedBox(
                          height: AppSize.s275Height,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.all(AppPadding.p8),
                                child: ListItemHome(
                                    product: products[index], isNew: true),
                              );
                            },
                          ),
                        );
                      }
                      return const CustomCircularProgressIndicator();
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSaleWidget(String title, String description) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Style.textStyle28.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(AppStrings.viewAll, style: Style.textStyle14),
            ],
          ),
          Text(
            description,
            style: Style.textStyle15.copyWith(color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }
}
