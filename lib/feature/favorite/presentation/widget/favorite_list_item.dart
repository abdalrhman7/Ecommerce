import 'package:e_commerce/feature/product_details/data/model/Product_details_model.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_value.dart';
import '../../../../core/constants/text_style.dart';
import '../../../../core/widget/buildRichText.dart';
import '../../../../core/widget/rating-bar_indicator.dart';

class FavoriteListItem extends StatelessWidget {
  const FavoriteListItem({
    super.key,
    required this.favorite,
  });

  final FavoriteModel favorite;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s125Height,
      //width: double.infinity,
      child: Card(
        elevation: 0.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p12),
          child: FittedBox(
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
                      image: NetworkImage(favorite.imgUrl),
                    ),
                  )),
                ),
                SizedBox(width: AppSize.s10Width),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppSize.s20Height),
                    Text(
                      favorite.title,
                      style: Style.textStyle18
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: AppSize.s4Height),
                    Row(
                      children: [
                        const BuildRichText(
                            title: AppStrings.color, description: 'black'),
                        SizedBox(width: AppSize.s20Width),
                        const BuildRichText(
                            title: AppStrings.size, description: 'XXl'),
                      ],
                    ),
                    SizedBox(
                      height: AppSize.s35Height,
                    ),
                    Row(
                      children: [
                        Text('${favorite.price}\$'),
                        SizedBox(width: AppSize.s50Width),
                        const RatingBarIndicatorWidget(size: 16),
                        SizedBox(width: AppSize.s4Width),
                        Text(
                          '(50)',
                          style: Style.textStyle12,
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppPadding.p12),
                  child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        // BlocProvider.of<CartCubit>(context)
                        //     .deleteItemFromCart(cartItem);
                        // mainSnackBar(context ,AppStrings.itemDeleted);
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
