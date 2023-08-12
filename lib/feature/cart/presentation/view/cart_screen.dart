import 'package:e_commerce/core/constants/app_value.dart';
import 'package:e_commerce/core/constants/text_style.dart';
import 'package:e_commerce/core/widget/main_button.dart';
import 'package:e_commerce/feature/cart/business_logic/cart_cubit.dart';
import 'package:e_commerce/feature/cart/data/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/widget/CustomCircularProgressIndicator.dart';
import '../widget/cart_list_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int totalPrice = 0;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: AppPadding.p14),
                  child: const Icon(Icons.search),
                ),
              ],
            ),
            SizedBox(height: AppSize.s20Height),
            Text(
              'My Cart',
              style: Style.textStyle28.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: AppSize.s16Height),
            StreamBuilder<List<CartModel>>(
                stream: BlocProvider.of<CartCubit>(context).getAllCartItems(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    final cartItems = snapshot.data;

                    if (cartItems == null || cartItems.isEmpty) {
                      return const Center(
                        child: Text(AppStrings.noDataAvailable),
                      );
                    }
                    for (var price in cartItems) {
                      totalPrice += price.price;
                      print(totalPrice);
                    }
                    return SizedBox(
                      height: AppSize.s380Height,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: cartItems.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return CartListItem(cartItem: cartItems[index]);
                        },
                      ),
                    );
                  }
                  return const CustomCircularProgressIndicator();
                }),
            SizedBox(
              height: AppSize.s18Height,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Amount:',
                  style:
                      Style.textStyle16.copyWith(color: Colors.grey.shade500),
                ),
                Text(
                  '1500',
                  style:
                      Style.textStyle18.copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: AppSize.s18Height,
            ),
            MainButton(
              text: 'checkout',
              onTap: () {},
              hasCircularBorder: true,
            )
          ],
        ),
      ),
    );
  }
}
