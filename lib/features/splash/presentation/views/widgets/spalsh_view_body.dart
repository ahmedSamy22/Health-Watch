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
    return Center(
        child: Image.asset(
      AssetsData.logo,
      width: 250,
      height: 250,
    ));
  }

  void navigateToAuth() {
    Future.delayed(
      const Duration(seconds: 2),
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
