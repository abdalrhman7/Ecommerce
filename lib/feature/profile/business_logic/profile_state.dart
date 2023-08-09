part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLogoutLoadingState extends ProfileState {}

class ProfileLogoutSuccessState extends ProfileState {}

