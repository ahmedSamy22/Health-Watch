import 'package:bio_medical/core/utils/app_router.dart';
import 'package:bio_medical/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    navigateToAuth();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60.0),
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            // AssetsData.logoFinal,
            // width: MediaQuery.of(context).size.width * 0.7,
            AssetsData.logoFinal,
            width: MediaQuery.of(context).size.width * 0.7,
          ),
          const Text(
            'Health Bracelet',
            style: TextStyle(
              fontFamily: 'TiltNeon',
              fontSize: 26.0,
              color: Colors.red,
            ),
          ),
          const Text(
            '، بكلمة واحدة لشخص سقيته جرعة حياة',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Amiri',
              fontSize: 22.0,
              //color: Colors.red,
            ),
          ),
          const Text(
            '.وبهدية بسيطة اعطيته نبضة حياة',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Amiri',
              fontSize: 22.0,
              //color: Colors.red,
            ),
          ),
        ],
      )),
    );
  }

  void navigateToAuth() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (AppRouter.loged) {
          GoRouter.of(context).pushReplacement(AppRouter.kHomeRouteKey);
        } else {
          GoRouter.of(context).pushReplacement(AppRouter.kLoginRouteKey);
        }
      },
    );
  }
}
