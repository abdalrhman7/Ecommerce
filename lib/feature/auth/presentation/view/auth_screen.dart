import 'package:e_commerce/core/constants/app_value.dart';
import 'package:e_commerce/core/function/main_dialog.dart';
import 'package:e_commerce/feature/auth/business_logic/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/text_style.dart';
import '../../../../core/utilities/my_validators.dart';
import '../../../../core/widget/CustomCircularProgressIndicator.dart';
import '../../../../core/widget/defaultTextFormFiled.dart';
import '../../../../core/widget/main_button.dart';
import '../../../../core/widget/social_media_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AuthCubit>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppPadding.p20),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppSize.s30Height),
                  Text(
                    isLogin ? AppStrings.login : AppStrings.register,
                    style:
                        Style.textStyle24.copyWith(color: Colors.grey.shade900),
                  ),
                  SizedBox(height: AppSize.s80Height),
                  buildEmailTextFormFiled(),
                  SizedBox(height: AppSize.s20Height),
                  buildPasswordTextFormFiled(),
                  if (!isLogin) SizedBox(height: AppSize.s20Height),
                  if (!isLogin) buildConfirmPasswordTextFormFiled(),
                  SizedBox(height: AppSize.s20Height),
                  if (isLogin)
                    Align(
                        alignment: Alignment.topRight,
                        child: Text(AppStrings.forgetYourPassword,
                            style: Style.textStyle16)),
                  SizedBox(height: AppSize.s20Height),
                  buildBlocConsumerMainButton(cubit),
                  SizedBox(height: AppSize.s20Height),
                  switchLoginRegisterButton(),
                  Divider(
                    height: AppSize.s10Height,
                    thickness: 2,
                  ),
                  SizedBox(height: AppSize.s16Height),
                  Align(
                    child: buildBlocConsumerSocialMediaButton(cubit),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBlocConsumerSocialMediaButton(AuthCubit cubit) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInWithGoogleFailureState) {
          MainDialog(
                  context: context, title: 'Error', content: state.errorMessage)
              .showAlertDialog();
        }
      },
      builder: (context, state) {
        if (state is SignInWithGoogleLoadingState) {
          return const CustomCircularProgressIndicator();
        }
        return SocialMediaButton(
          iconName: AppAssets.googleIcon,
          onPress: () => cubit.signInWithGoogle(),
        );
      },
    );
  }

  Widget buildEmailTextFormFiled() {
    return DefaultTextFormFiled(
      controller: _emailController,
      label: AppStrings.email,
      hintText: AppStrings.enterYourEmail,
      validate: (value) => MyValidators.emailValidator(value),
      type: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }

  DefaultTextFormFiled buildPasswordTextFormFiled() {
    return DefaultTextFormFiled(
      controller: _passwordController,
      label: AppStrings.password,
      hintText: AppStrings.enterYourPassword,
      validate: (value) => MyValidators.passwordValidator(value),
      type: TextInputType.visiblePassword,
      textInputAction: isLogin ? TextInputAction.done : TextInputAction.next,
      isPassword: true,
    );
  }

  Widget buildConfirmPasswordTextFormFiled() {
    return DefaultTextFormFiled(
      controller: _confirmPasswordController,
      label: AppStrings.reEnterPassword,
      hintText: AppStrings.confirmPassword,
      validate: (value) => MyValidators.repeatPasswordValidator(
          value: value, password: _passwordController.text),
      type: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      isPassword: true,
    );
  }

  Widget buildBlocConsumerMainButton(AuthCubit cubit) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailureState) {
          MainDialog(
                  context: context, title: 'Error', content: state.errorMessage)
              .showAlertDialog();
        }
      },
      builder: (context, state) {
        if (state is AuthLoadingState) {
          return const CustomCircularProgressIndicator();
        }
        return MainButton(
          onTap: () {
            validateAndSubmit(cubit);
          },
          text: isLogin ? AppStrings.login : AppStrings.register,
        );
      },
    );
  }

  void validateAndSubmit(AuthCubit cubit) {
    if (_formKey.currentState!.validate()) {
      isLogin
          ? cubit.loginWithEmailAndPassword(
              _emailController.text, _passwordController.text)
          : cubit.signUpWithEmailAndPassword(
              _emailController.text, _passwordController.text);
    }
  }

  Widget switchLoginRegisterButton() {
    return Align(
      child: TextButton(
        onPressed: () {
          setState(() {
            isLogin = !isLogin;
            _formKey.currentState!.reset();
          });
        },
        child: Text(
          isLogin
              ? AppStrings.doNotHaveAnAccount
              : AppStrings.alreadyHaveAnAccount,
          style: Style.textStyle16.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
