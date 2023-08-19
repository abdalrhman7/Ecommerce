import 'package:e_commerce/core/constants/app_value.dart';
import 'package:e_commerce/core/constants/text_style.dart';
import 'package:e_commerce/core/widget/main_button.dart';
import 'package:e_commerce/feature/cart/business_logic/cart_cubit.dart';
import 'package:e_commerce/feature/cart/data/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/widget/CustomCircularProgressIndicator.dart';
import '../../../../core/widget/search.dart';
import '../widget/cart_list_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchBarWidget(),
            SizedBox(height: AppSize.s20Height),
            Text(
              AppStrings.myCart,
              style: Style.textStyle28.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: AppSize.s16Height),
            buildGetAllCartProductWidget(context),
            SizedBox(
              height: AppSize.s10Height,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.totalAmount,
                  style:
                      Style.textStyle16.copyWith(color: Colors.grey.shade500),
                ),
                buildGetTotalPriceWidget(context),
              ],
            ),
            SizedBox(
              height: AppSize.s16Height,
            ),
            MainButton(
              text: AppStrings.checkout,
              onTap: () {},
              hasCircularBorder: true,
            )
          ],
        ),
      ),
    );
  }

  Widget buildGetAllCartProductWidget(BuildContext context) {
    return StreamBuilder<List<CartModel>>(
        stream: BlocProvider.of<CartCubit>(context).getAllCartItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final cartItems = snapshot.data;

            return SizedBox(
              height: AppSize.s400Height,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: cartItems!.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return CartListItem(cartItem: cartItems[index]);
                },
              ),
            );
          }
          return const CustomCircularProgressIndicator();
        });
  }

  Widget buildGetTotalPriceWidget(BuildContext context) {
    return StreamBuilder<List<CartModel>>(
        stream: BlocProvider.of<CartCubit>(context).getAllCartItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            int totalPrice = 0;
            for (var result in snapshot.data!) {
              totalPrice += result.price;
            }
            return Text(
              totalPrice.toString(),
              style: Style.textStyle18.copyWith(fontWeight: FontWeight.bold),
            );
          }
          return const CustomCircularProgressIndicator();
        });
  }
}
