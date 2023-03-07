import 'package:bio_medical/core/utils/app_router.dart';
import 'package:bio_medical/core/utils/cache_helper.dart';
import 'package:bio_medical/features/auth/data/models/user_model.dart';
import 'package:bio_medical/features/auth/presentation/manger/register_cubit/register_cubit_states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitState());
  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String name,
    required String email,
    required String password,
    String? image,
    required String phone,
  }) {
    emit(RegisterLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      // CacheHelper.saveData(key: 'uId', value: value.user?.uid);
      // uId = CacheHelper.getData(key: 'uId');
      CacheHelper.saveData(key: 'loged', value: true);
      AppRouter.loged = CacheHelper.getData(key: 'loged');
      // print(uId);
      createUser(
        name: name,
        email: email,
        phone: phone,
        uId: value.user?.uid,
      );
      print('creaaaaaaat');
      emit(RegisterSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }

  void createUser({
    required String name,
    required String email,
    required dynamic uId,
    required String phone,
  }) {
    UserModel userModel = UserModel(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
      image: 'assets/images/profileImage.png',
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(userModel.toMap())
        .then((value) {
      emit(CreateUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CreateUserErrorState());
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changePasswordVisability() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.remove_red_eye : Icons.visibility_off_outlined;
    emit(ChangeRegisterPasswordState());
  }
}
