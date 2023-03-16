import 'package:bio_medical/features/payment/presentation/manager/payment_cubit/payment_cubit_states.dart';
import 'package:dio/dio.dart';

import 'constants.dart';

class DioHelper {
  final _baseUrl = ApiContest.baseUrl;
  static late Dio dio;

  static initDio() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiContest.baseUrl,
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  }

  Future<Map<String, dynamic>> getData({required String url}) async {
    var response = await dio.get('$_baseUrl$url');
    return response.data;
  }

  static Future<Response> postData(
      {required String url, Map<String, dynamic>? data}) async {
    return await dio.post(
      url,
      data: data,
    );
  }
}
