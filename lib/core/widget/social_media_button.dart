import 'package:e_commerce/core/constants/app_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({
    Key? key,
    required this.iconName,
    required this.onPress,
  }) : super(key: key);
  final String iconName;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: AppSize.s60Height,
        width: AppSize.s60Width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0).w,
          color: Colors.white,
        ),
        child: Center(
          child: SvgPicture.asset(
            iconName,
            width: AppSize.s40Width,
            height: AppSize.s40Height,
          ),
        ),
      ),
    );
  }
}