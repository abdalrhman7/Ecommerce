import 'package:e_commerce/core/app_route/routes.dart';
import 'package:e_commerce/core/constants/app_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/text_style.dart';
import '../../../../core/widget/rating-bar_indicator.dart';
import '../../data/model/product_model.dart';

class ListItemHome extends StatelessWidget {
  final Product product;
  bool isNew = false;

  ListItemHome({
    Key? key,
    required this.product,
    required this.isNew,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        Navigator.of(context, rootNavigator: true).pushNamed(
          AppRoutes.productDetails,
          arguments: {'product': product},
        );
      },
      child: Stack(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  product.imgUrl,
                  width: AppSize.s182Width,
                  height: AppSize.s172Height,
                  fit: BoxFit.cover,
                ),
              ),
              if (isNew == false)
                Padding(
                  padding: EdgeInsets.all(AppPadding.p8),
                  child: SizedBox(
                    width: 50,
                    height: 25,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.red,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Center(
                          child: Text(
                            '${product.discountValue}%',
                            style:
                                Style.textStyle12.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Positioned(
            left: size.width * 0.39,
            bottom: size.height * 0.11,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2.w,
                    color: Colors.grey,
                    // spreadRadius: 0,
                  )
                ],
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20.w,
                child: InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.favorite,
                    size: 18.w,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const RatingBarIndicatorWidget(size: 22),
                    const SizedBox(width: 4.0),
                    Text(
                      '(50)',
                      style: Style.textStyle12,
                    ),
                  ],
                ),
                SizedBox(height: AppSize.s8Height),
                Text(
                  product.category,
                  style:
                      Style.textStyle12.copyWith(color: Colors.grey.shade600),
                ),
                SizedBox(height: AppSize.s6Height),
                Text(
                  product.title,
                  style: Style.textStyle16,
                ),
                const SizedBox(height: 6.0),
                Text(
                  '${product.price}',
                  style: Style.textStyle12.copyWith(
                    color: Colors.grey.shade600,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
