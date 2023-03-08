import 'package:bio_medical/core/utils/styles.dart';
import 'package:bio_medical/features/home/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:bio_medical/features/home/presentation/manager/profile_cubit/profile_cubit_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileCubitStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
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
                      if (state is GetUserSuccessState)
                        CircleAvatar(
                          radius: 48.0,
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          child: CircleAvatar(
                            radius: 45.0,
                            backgroundImage:
                                NetworkImage('${state.userModel.image}'),
                          ),
                        ),
                      if (state is GetUserErrorState)
                        CircleAvatar(
                          radius: 48.0,
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          child: const CircleAvatar(
                            radius: 45.0,
                            backgroundImage:
                                AssetImage('assets/images/profileImage.png'),
                          ),
                        ),
                      if (state is GetUserLoadingState)
                        CircleAvatar(
                          radius: 48.0,
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          child: const CircleAvatar(
                            radius: 45.0,
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'User Name',
                        style: Styles.textStyle20,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 3.0, horizontal: 7.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'أحدث المؤشرات الحيوية',
                      style: TextStyle(
                        fontFamily: 'Amiri',
                        fontSize: 20,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: double.infinity,
                      height: 180.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Color(0xffD8F1FD),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'ضغط الدم',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  '120/80',
                                  style: TextStyle(
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Icon(Icons.bar_chart_rounded),
                              ],
                            ),
                            const Spacer(),
                            Image.asset(
                              'assets/images/bloodPressureCard.png',
                              width: MediaQuery.of(context).size.width * 0.5,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: double.infinity,
                      height: 180.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Color(0xffFFE5B2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'ضربات القلب',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  '120/60',
                                  style: TextStyle(
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Icon(Icons.bar_chart_rounded),
                              ],
                            ),
                            const Spacer(),
                            Image.asset(
                              'assets/images/heartBeatsCard.png',
                              width: MediaQuery.of(context).size.width * 0.5,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: double.infinity,
                      height: 180.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Color(0xffFFEBF4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'درجة الحرارة',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  '37 C',
                                  style: TextStyle(
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Icon(
                                  Icons.bar_chart_rounded,
                                ),
                              ],
                            ),
                            const Spacer(),
                            Image.asset(
                              'assets/images/thermometerCard.png',
                              width: MediaQuery.of(context).size.width * 0.5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
