import 'package:e_commerce/core/constants/app_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../core/constants/text_style.dart';
import '../../data/model/product_model.dart';

class ListItemHome extends StatelessWidget {
  final Product product;

  const ListItemHome({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {},
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
              if(product.discountValue != null)
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
                    RatingBarIndicator(
                      itemSize: 22.w,
                      rating: 4.0,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      direction: Axis.horizontal,
                    ),
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
                  style:
                      Style.textStyle12.copyWith(color: Colors.grey.shade600),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
