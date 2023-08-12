import 'package:e_commerce/feature/cart/business_logic/cart_cubit.dart';
import 'package:e_commerce/feature/cart/data/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_value.dart';
import '../../../../core/constants/text_style.dart';
import '../../../../core/function/main_snack_bar.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({super.key, required this.cartItem});
  final CartModel cartItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s125Height,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: AppSize.s120Height,
                width: AppSize.s100Width,
                decoration: (BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(cartItem.imgUrl),
                  ),
                )),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartItem.title,
                    style:
                        Style.textStyle18.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      buildRichText(context, AppStrings.color, 'black'),
                      const SizedBox(width: 8.0),
                      buildRichText(context, AppStrings.size, cartItem.size),
                    ],
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppPadding.p12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        icon: const Icon(Icons.more_vert),
                        onPressed: () {
                          BlocProvider.of<CartCubit>(context)
                            .deleteItemFromCart(cartItem);
                          mainSnackBar(context ,AppStrings.itemDeleted);
                        }),
                    Text('${cartItem.price}\$')
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRichText(BuildContext context, String title, String description) {
    return Text.rich(
      TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: title,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.grey,
                ),
          ),
          TextSpan(
            text: description,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.black,
                ),
          ),
        ],
      ),
    );
  }
}
