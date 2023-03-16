import 'package:bio_medical/features/payment/presentation/manager/payment_cubit/payment_cubit.dart';
import 'package:bio_medical/features/payment/presentation/manager/payment_cubit/payment_cubit_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit()..getAuthToken(context),
      child: BlocConsumer<PaymentCubit, PaymentCubitStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [],
            ),
          );
        },
      ),
    );
  }
}
