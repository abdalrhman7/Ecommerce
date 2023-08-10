import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle appStyle(
    {required double size, required FontWeight fw, Color? color}) {
  return TextStyle(
    fontSize: size.sp,
    fontWeight: fw,
    color: color,
    overflow: TextOverflow.ellipsis,
  );
}

class Style {

  static final textStyle12 = appStyle(
    size: 12,
    fw: FontWeight.normal,
  );

  static final textStyle14 = appStyle(
    size: 14,
    fw: FontWeight.normal,
  );

  static final textStyle15 = appStyle(
    size: 15,
    fw: FontWeight.normal,
  );

  static final textStyle16 = appStyle(
    size: 16,
    fw: FontWeight.normal,
  );

  static final textStyle18 = appStyle(size: 18, fw: FontWeight.w600);

  static final textStyle20 = appStyle(
    size: 20,
    fw: FontWeight.normal,
  );
  static final textStyle22 = appStyle(
    size: 22,
    fw: FontWeight.normal,
  );
  static final textStyle24 = appStyle(
    size: 24,
    fw: FontWeight.normal,
  );
  static final textStyle26 = appStyle(
    size: 26,
    fw: FontWeight.normal,
  );

  static final textStyle28 = appStyle(
    size: 28.sp,
    fw: FontWeight.normal,
  );

  static final textStyle30 = appStyle(
    size: 30.sp,
    fw: FontWeight.normal,
  );

  static final textStyle34 = appStyle(
    size: 34.sp,
    fw: FontWeight.bold,
  );
}
