import 'package:bio_medical/core/utils/constants.dart';
import 'package:bio_medical/core/utils/dio_helper.dart';
import 'package:bio_medical/features/home/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:bio_medical/features/payment/presentation/manager/payment_cubit/payment_cubit_states.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentCubit extends Cubit<PaymentCubitStates> {
  PaymentCubit() : super(PaymentInitialState());

  static PaymentCubit get(context) => BlocProvider.of(context);

  Future<void> getAuthToken(BuildContext context) async {
    emit(PaymentAuthLoadingState());
    DioHelper.postData(
      url: ApiContest.getAuthToken,
      data: {
        'api_key': ApiContest.paymentApiKey,
      },
    ).then((value) {
      ApiContest.paymentFirstToken = value.data['token'];
      getOrderId(
        userName: ProfileCubit.get(context).userModel?.name,
        email: ProfileCubit.get(context).userModel?.email,
        phone: ProfileCubit.get(context).userModel?.phone,
      );
      print('token is ${ApiContest.paymentFirstToken}');
      emit(PaymentAuthSuccessState());
    }).catchError((error) {
      print('Auth error is ${error.toString()}');
      emit(PaymentAuthErrorState());
    });
  }

  Future getOrderId({
    required String? userName,
    required String? email,
    required String? phone,
  }) async {
    emit(PaymentGetOrderIdLoadingState());
    DioHelper.postData(
      url: ApiContest.getOrderId,
      data: {
        "auth_token": ApiContest.paymentFirstToken,
        "delivery_needed": "false",
        "amount_cents": "100",
        "currency": "EGP",
        "items": [],
      },
    ).then((value) {
      ApiContest.paymentOrderId = value.data['id'];
      print('order id is ${ApiContest.paymentOrderId}');
      getPaymentRequest(
          userName: userName,
          email: email,
          phone: phone,
          orderId: value.data['id']);
      emit(PaymentGetOrderIdSuccessState());
    }).catchError((error) {
      print('Order error is ${error.toString()}');
      emit(PaymentGetOrderIdErrorState());
    });
  }

  Future<void> getPaymentRequest({
    required String? userName,
    required String? email,
    required String? phone,
    required int? orderId,
  }) async {
    emit(PaymentGetPaymentRequestLoadingState());
    DioHelper.postData(
      url: ApiContest.getPaymentId,
      data: {
        "auth_token": ApiContest.paymentFirstToken,
        "amount_cents": "100",
        "expiration": 3600,
        "order_id": ApiContest.paymentOrderId,
        "billing_data": {
          "apartment": "NA",
          "email": email,
          "floor": "NA",
          "first_name": userName,
          "street": "NA",
          "building": "NA",
          "phone_number": phone,
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "last_name": userName,
          "state": "NA"
        },
        "currency": "EGP",
        "integration_id": ApiContest.integrationIdCard,
        "lock_order_when_paid": "false"
      },
    ).then((value) {
      ApiContest.finalToken = value.data['token'];
      print('final token is ${ApiContest.finalToken}');
      emit(PaymentGetPaymentRequestSuccessState());
    }).catchError((error) {
      print('Request error is ${error.toString()}');
      emit(PaymentGetPaymentRequestErrorState());
    });
  }
}
