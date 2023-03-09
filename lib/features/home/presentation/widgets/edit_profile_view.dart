import 'package:bio_medical/core/custom_widgets/custom_form_field.dart';
import 'package:bio_medical/core/utils/styles.dart';
import 'package:bio_medical/features/home/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:bio_medical/features/home/presentation/manager/profile_cubit/profile_cubit_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileCubitStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = ProfileCubit.get(context).userModel;
        var profileImage = ProfileCubit.get(context).profileImage;
        dynamic nameController = TextEditingController();
        dynamic phoneController = TextEditingController();
        nameController.text = userModel?.name;
        phoneController.text = userModel?.phone;

        return Scaffold(
          appBar: AppBar(title: const Text('Edit Profile'), actions: [
            TextButton(
              onPressed: () {
                ProfileCubit.get(context).updateUser(
                  name: nameController.text,
                  phone: phoneController.text,
                );
              },
              child: Text('UPDATE',
                  style: Styles.textStyle16.copyWith(
                    color: Colors.blue,
                  )),
            ),
            SizedBox(
              width: 10.0,
            ),
          ]),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  if (state is UpdateUserLoadingState)
                    const LinearProgressIndicator(),
                  // if (state is! UpdateUserLoadingState)
                  //   const SizedBox(
                  //     height: 20.0,
                  //   ),
                  SizedBox(
                    height: 240.0,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: Container(
                            height: 210.0,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5.0),
                                topLeft: Radius.circular(5.0),
                              ),
                              image: DecorationImage(
                                image: AssetImage('assets/images/cover.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 48.0,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              child: CircleAvatar(
                                radius: 45.0,
                                backgroundImage: profileImage == null
                                    ? NetworkImage('${userModel?.image}')
                                    : FileImage(profileImage) as ImageProvider,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                ProfileCubit.get(context).getProfileImage();
                              },
                              icon: const CircleAvatar(
                                child:
                                    Icon(Icons.camera_alt_outlined, size: 20.0),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  customFormField(
                      controller: nameController,
                      keyboardTybe: TextInputType.name,
                      prefixIcon: Icons.person,
                      label: 'User Name',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'User Name can\'t be empty';
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 20.0,
                  ),
                  customFormField(
                      controller: phoneController,
                      keyboardTybe: TextInputType.phone,
                      prefixIcon: Icons.call,
                      label: 'Phone Number',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Phone Number can\'t be empty';
                        }
                        return null;
                      }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
