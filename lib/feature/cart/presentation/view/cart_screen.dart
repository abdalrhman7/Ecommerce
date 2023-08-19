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

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    BlocProvider.of<CartCubit>(context).getAllCartItems();
   // BlocProvider.of<CartCubit>(context).getTotalPrice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //var cubit = BlocProvider.of<CartCubit>(context);
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
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                if (state is GetAllCartSuccess) {
                  final cartItems = state.cartItem;
                  return SizedBox(
                    height: AppSize.s400Height,
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
              },
            ),
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
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    if (state is GetAllCartSuccess) {
                      return Text(
                        state.totalPrice.toString(),
                        style: Style.textStyle18
                            .copyWith(fontWeight: FontWeight.bold),
                      );
                    }
                    return const CustomCircularProgressIndicator();
                  },
                )
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
}

//
// for (var price in cartItems) {
// totalPrice += price.price;
// print(totalPrice);
// }
