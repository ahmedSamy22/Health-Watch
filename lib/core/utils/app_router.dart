import 'package:bio_medical/core/utils/cache_helper.dart';
import 'package:bio_medical/core/utils/custom_transition_page.dart';
import 'package:bio_medical/features/auth/presentation/login_view.dart';
import 'package:bio_medical/features/auth/presentation/signUp_view.dart';
import 'package:bio_medical/features/home/presentation/disease_view.dart';
import 'package:bio_medical/features/home/presentation/home_view.dart';
import 'package:bio_medical/features/home/presentation/manager/diseases_cubit/diseases_cubit.dart';
import 'package:bio_medical/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:bio_medical/features/home/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:bio_medical/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static String kLoginRouteKey = '/loginView';
  static String kSignUpRouteKey = '/signUpView';
  static String kHomeRouteKey = '/homeView';
  static String kDiseaseRouteKey = '/diseaseView';

  static dynamic
      loged; // it will be saved in SharedPref and initialize in login or signUp screen
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kLoginRouteKey,
        pageBuilder: (context, state) => buildPageWithScaleTransition<void>(
          context: context,
          state: state,
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: kSignUpRouteKey,
        pageBuilder: (context, state) => buildPageWithSlideTransition<void>(
          context: context,
          state: state,
          child: const SignUpView(),
        ),
      ),
      GoRoute(
        path: kHomeRouteKey,
        pageBuilder: (context, state) => buildPageWithSlideTransition<void>(
          context: context,
          state: state,
          child: MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => HomeCubit(),
            ),
            BlocProvider(
                create: (context) => DiseasesCubit()..createDataBase()),
            BlocProvider(
              create: (context) => ProfileCubit()..getUserData(),
            ),
          ], child: const HomeView()),
        ),
      ),
      GoRoute(
        path: kDiseaseRouteKey,
        pageBuilder: (context, state) => buildPageWithSlideTransition<void>(
          context: context,
          state: state,
          child: DiseaseView(
            model: state.extra as Map,
          ),
        ),
      ),
    ],
  );
}
