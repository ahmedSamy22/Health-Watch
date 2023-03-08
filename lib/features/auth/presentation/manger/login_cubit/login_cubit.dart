import 'package:bio_medical/core/utils/app_router.dart';
import 'package:bio_medical/core/utils/cache_helper.dart';
import 'package:bio_medical/core/utils/constants.dart';
import 'package:bio_medical/features/auth/presentation/manger/login_cubit/login_cubit_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      CacheHelper.saveData(key: 'uId', value: value.user?.uid);
      uId = CacheHelper.getData(key: 'uId');
      CacheHelper.saveData(key: 'loged', value: true);
      AppRouter.loged = CacheHelper.getData(key: 'loged');

      emit(LoginSuccessState(value.user?.uid));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changePasswordVisability() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.remove_red_eye : Icons.visibility_off_outlined;
    emit(LoginChangePasswordState());
  }
}
