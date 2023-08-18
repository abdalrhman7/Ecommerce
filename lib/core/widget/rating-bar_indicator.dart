import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class RatingBarIndicatorWidget extends StatelessWidget {
  const RatingBarIndicatorWidget({
    super.key, required this.size,
  });
  final int size ;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      itemSize: size.w,
      rating: 4.0,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      direction: Axis.horizontal,
    );
  }
}