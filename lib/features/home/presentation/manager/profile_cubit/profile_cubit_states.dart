import 'package:bio_medical/features/auth/data/models/user_model.dart';

abstract class ProfileCubitStates {}

class ProfileCubitInitialState extends ProfileCubitStates {}

class GetUserLoadingState extends ProfileCubitStates {}

class GetUserSuccessState extends ProfileCubitStates {
  final UserModel userModel;
  GetUserSuccessState(this.userModel);
}

class GetUserErrorState extends ProfileCubitStates {
  final String error;
  GetUserErrorState(this.error);
}

class GetProfileImageSuccessState extends ProfileCubitStates {}

class GetProfileImageErrorState extends ProfileCubitStates {}

class UploadProfileImageSuccessState extends ProfileCubitStates {}

class UploadProfileImageErrorState extends ProfileCubitStates {}

class UpdateUserLoadingState extends ProfileCubitStates {}

class UpdateUserErrorState extends ProfileCubitStates {}
