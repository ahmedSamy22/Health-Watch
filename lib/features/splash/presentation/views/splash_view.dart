import 'package:bio_medical/features/splash/presentation/views/widgets/spalsh_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SplashViewBody(),
    );
  }
}
