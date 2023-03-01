import 'package:bio_medical/features/home/presentation/manager/home_cubit/home_cubit_states.dart';
import 'package:bio_medical/features/home/presentation/widgets/connect_body.dart';
import 'package:bio_medical/features/home/presentation/widgets/home_body.dart';
import 'package:bio_medical/features/home/presentation/widgets/profile_body.dart';
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
}
