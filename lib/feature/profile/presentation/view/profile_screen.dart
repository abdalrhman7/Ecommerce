import 'package:e_commerce/core/constants/app_value.dart';
import 'package:e_commerce/core/constants/text_style.dart';
import 'package:e_commerce/core/widget/CustomCircularProgressIndicator.dart';
import 'package:e_commerce/core/widget/main_button.dart';
import 'package:e_commerce/feature/profile/business_logic/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../core/constants/app_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppSize.s80Height),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Profile',
                style: Style.textStyle28,
              ),
              SizedBox(height: AppSize.s20Height),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: AppSize.s60Height,
                    width: AppSize.s60Width,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                          AppStrings.profilePhoto,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: AppSize.s16Width),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Abdalrhman Amr',
                        style: Style.textStyle18,
                      ),
                      Text(
                        BlocProvider.of<ProfileCubit>(context).getProfileInfo() ?? '',
                        style: Style.textStyle16
                            .copyWith(color: Colors.grey.shade700),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.only(
            bottom: AppPadding.p14,
            right: AppPadding.p8,
            left: AppPadding.p8,
          ),
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if(state is ProfileLogoutLoadingState){
                return const CustomCircularProgressIndicator();
              }
              return MainButton(text: 'Log Out', onTap: () {
                BlocProvider.of<ProfileCubit>(context).logout();
              },
              );
            },
          ),
        ),
      ],
    );
  }
}
