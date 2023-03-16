import 'package:bio_medical/core/utils/cache_helper.dart';
import 'package:bio_medical/features/auth/data/models/user_model.dart';
import 'package:bio_medical/features/home/presentation/manager/home_cubit/home_cubit_states.dart';
import 'package:bio_medical/features/home/presentation/widgets/connect_body.dart';
import 'package:bio_medical/features/home/presentation/widgets/home_body.dart';
import 'package:bio_medical/features/home/presentation/widgets/profile_body.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeCubitStates> {
  HomeCubit() : super(HomeCubitInitialState());
  static HomeCubit get(context) => BlocProvider.of(context);

  List<String> titles = [
    'Home',
    'Connect',
    'Profile',
  ];

  List<Color> appBarColor = [
    Colors.white,
    const Color(0xffFF938F),
    Colors.white,
  ];

  List<Widget> screens = [
    const HomeBody(),
    const ConnectBody(),
    const ProfileBody(),
  ];

  int currentIndex = 0;
  void changeBNav(index) {
    currentIndex = index;
    emit(ChangeNavBarState());
  }

  bool isBottomSheetShown = false;
  bool subscribed = false;

  void changeBottomSheetState(bool isShown) {
    isBottomSheetShown = isShown;

    emit(BottomSheetShownState());
  }
}
