import 'dart:io';

import 'package:bio_medical/core/utils/cache_helper.dart';
import 'package:bio_medical/features/auth/data/models/user_model.dart';
import 'package:bio_medical/features/home/presentation/manager/profile_cubit/profile_cubit_states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ProfileCubit extends Cubit<ProfileCubitStates> {
  ProfileCubit() : super(ProfileCubitInitialState());

  UserModel? userModel;

  void getUserData() {
    emit(GetUserLoadingState());

    var uid = CacheHelper.getData(key: 'uId');
    FirebaseFirestore.instance.collection('users').doc(uid).get().then((value) {
      print('hereeeeeeee ${value.data()}');
      userModel = UserModel.fromJson(value.data());
      emit(GetUserSuccessState(userModel!));
    }).catchError((error) {
      print('errrrrror is ${error.toString()}');
      emit(GetUserErrorState(error.toString()));
    });
  }

  File? profileImage;
  var profilepicker = ImagePicker();

  Future getProfileImage() async {
    final pickedFile =
        await profilepicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      uploadProfileImage();
      emit(GetProfileImageSuccessState());
    } else {
      print('no image selected');
      emit(GetProfileImageErrorState());
    }
  }

  String? profileImageUrl;

  void uploadProfileImage() {
    emit(UpdateUserLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        profileImageUrl = value;
        updateUser(
          image: value,
        );
        emit(UploadProfileImageSuccessState());
      }).catchError((error) {
        emit(UploadProfileImageErrorState());
      });
    }).catchError((error) {
      print(error.toString());
      emit(UploadProfileImageErrorState());
    });
  }

  void updateUser({
    String? name,
    String? phone,
    String? bio,
    String? cover,
    String? image,
  }) {
    emit(UpdateUserLoadingState());

    UserModel model = UserModel(
      name: name ?? userModel?.name,
      email: userModel?.email,
      phone: phone ?? userModel?.phone,
      uId: userModel?.uId,
      image: image ?? userModel?.image,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel?.uId)
        .update(model.toMap())
        .then((value) {
      getUserData();
    }).catchError((error) {
      emit(UpdateUserErrorState());
    });
  }
}
