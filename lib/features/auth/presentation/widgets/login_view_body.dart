import 'package:bio_medical/core/custom_widgets/custom_button.dart';
import 'package:bio_medical/core/custom_widgets/custom_form_field.dart';
import 'package:bio_medical/core/custom_widgets/show_toast.dart';
import 'package:bio_medical/core/utils/app_router.dart';
import 'package:bio_medical/core/utils/assets.dart';
import 'package:bio_medical/core/utils/styles.dart';
import 'package:bio_medical/features/auth/presentation/manger/login_cubit/login_cubit.dart';
import 'package:bio_medical/features/auth/presentation/manger/login_cubit/login_cubit_states.dart';
import 'package:bio_medical/features/auth/presentation/signUp_view.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            showToast(text: state.error, state: ToastStates.ERROR);
          }

          if (state is LoginSuccessState) {
            GoRouter.of(context).pushReplacement(AppRouter.kHomeRouteKey);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    color: const Color(0xff6e2594),
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(
                            MediaQuery.of(context).size.width, 110.0)),
                  ),
                  padding: const EdgeInsetsDirectional.only(top: 30.0),
                  child: Center(
                      child: Image.asset(
                    AssetsData.login_pic,
                    height: 180,
                    width: 180,
                  )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 30),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Login',
                                  style: Styles.textStyle28,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Please login to your account.',
                                  style: Styles.captionText16,
                                ),
                              ],
                            ),
                            const Spacer(),
                            Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(120),
                                    topLeft: Radius.circular(120)),
                                color: Color(0xffFD8C00),
                                shape: BoxShape.rectangle,
                              ),
                              height: 70,
                              width: 35,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 30,
                          right: 30,
                        ),
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 26,
                              ),
                              customFormField(
                                  controller: emailController,
                                  keyboardTybe: TextInputType.emailAddress,
                                  prefixIcon: Icons.email_outlined,
                                  label: 'Email Address',
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Email can\'t be empty';
                                    }
                                    return null;
                                  }),
                              const SizedBox(
                                height: 20,
                              ),
                              customFormField(
                                controller: passwordController,
                                keyboardTybe: TextInputType.visiblePassword,
                                isPassword: LoginCubit.get(context).isPassword,
                                prefixIcon: Icons.lock_outline,
                                suffix: LoginCubit.get(context).suffix,
                                suffixPressed: () {
                                  LoginCubit.get(context)
                                      .changePasswordVisability();
                                },
                                label: 'Password',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password is too short';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 26,
                              ),
                              ConditionalBuilder(
                                condition: state is! LoginLoadingState,
                                builder: (context) => customButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      LoginCubit.get(context).userLogin(
                                        email: emailController.text.trim(),
                                        password:
                                            passwordController.text.trim(),
                                      );
                                    }
                                  },
                                  width: double.infinity,
                                  text: 'login',
                                ),
                                fallback: (context) => const Center(
                                    child: CircularProgressIndicator()),
                              ),
                              Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Forgot password?',
                                    style: TextStyle(
                                      color: Color(0xffE70B89),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Don\'t have an account?',
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      // GoRouter.of(context)
                                      //     .push(AppRouter.kSignUpRouteKey);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SignUpView()),
                                      );
                                    },
                                    child: const Text(
                                      'Create new now',
                                      style: TextStyle(
                                        color: Color(0xffE70B89),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                    color: const Color(0xff6e2594),
                    borderRadius: BorderRadius.vertical(
                        top: Radius.elliptical(
                            MediaQuery.of(context).size.width, 130.0)),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
