import 'package:bio_medical/core/custom_widgets/custom_button.dart';
import 'package:bio_medical/core/custom_widgets/custom_form_field.dart';
import 'package:bio_medical/core/custom_widgets/show_toast.dart';
import 'package:bio_medical/core/utils/app_router.dart';
import 'package:bio_medical/core/utils/assets.dart';
import 'package:bio_medical/core/utils/styles.dart';
import 'package:bio_medical/features/auth/presentation/manger/register_cubit/register_cubit.dart';
import 'package:bio_medical/features/auth/presentation/manger/register_cubit/register_cubit_states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterErrorState) {
            showToast(text: state.error, state: ToastStates.ERROR);
          }

          if (state is CreateUserSuccessState) {
            GoRouter.of(context).pushReplacement(AppRouter.kHomeRouteKey);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
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
                  height: MediaQuery.of(context).size.height * 0.68,
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
                                  'Sign Up',
                                  style: Styles.textStyle28,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Create a new account.',
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
                                height: 20,
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
                                height: 10,
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
                                height: 10,
                              ),
                              customFormField(
                                  controller: phoneController,
                                  keyboardTybe: TextInputType.phone,
                                  prefixIcon: Icons.phone,
                                  label: 'Phone Number',
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Phone Number can\'t be empty';
                                    }
                                    return null;
                                  }),
                              const SizedBox(
                                height: 10,
                              ),
                              customFormField(
                                controller: passwordController,
                                keyboardTybe: TextInputType.visiblePassword,
                                isPassword:
                                    RegisterCubit.get(context).isPassword,
                                prefixIcon: Icons.lock_outline,
                                suffix: RegisterCubit.get(context).suffix,
                                suffixPressed: () {
                                  RegisterCubit.get(context)
                                      .changePasswordVisability();
                                },
                                label: 'Password',
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      value.toString().length < 6) {
                                    return 'Password is too short';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ConditionalBuilder(
                                condition: state is! RegisterLoadingState,
                                builder: (context) => customButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      RegisterCubit.get(context).userRegister(
                                        name: nameController.text.trim(),
                                        email: emailController.text.trim(),
                                        password:
                                            passwordController.text.trim(),
                                        phone: phoneController.text.trim(),
                                      );
                                    }
                                  },
                                  width: double.infinity,
                                  text: 'Sign Up',
                                ),
                                fallback: (context) => const Center(
                                    child: CircularProgressIndicator()),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Already have an account?',
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      GoRouter.of(context).pop();
                                    },
                                    child: const Text(
                                      'Login now',
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
                  height: MediaQuery.of(context).size.height * 0.07,
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
