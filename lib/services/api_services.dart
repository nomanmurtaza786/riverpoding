// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:superwizor/features/authentication/auth_manager.dart';
import 'package:superwizor/models/activity_model.dart';
import 'package:superwizor/models/login_model.dart';
import 'package:superwizor/models/passengers_model.dart';
import 'package:superwizor/models/product_model.dart';
import 'package:superwizor/providers/providers.dart';

part 'api_services.g.dart';

@Riverpod(
  keepAlive: true,
)
ApiServices apiServices(ApiServicesRef ref) {
  final dio = ref.watch(dioClient);
  return ApiServices(dio: dio);
}

class ApiServices {
  static const url = 'http://www.boredapi.com/api/activity/';
  static const url2 = 'https://api.instantwebtools.net/v2/passenger?';

  final client = http.Client();
  final Dio dio;
  ApiServices({
    required this.dio,
  });

  Future<ActivityModel> getActivity() async {
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        // final Map<String, dynamic> json = jsonDecode(response.data);
        return ActivityModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load activity');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<PassengersModel> getPassengers({int page = 0}) async {
    try {
      final response = await dio.get(
        '${url2}page=$page&size=10',
      );
      if (response.statusCode == 200) {
        // final Map<String, dynamic> json = jsonDecode(response.body);
        return PassengersModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load Passengers');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<ProductModel> getProducts() async {
    try {
      final response = await dio.get(
        'https://dummyjson.com/auth/products',
      );
      if (response.statusCode == 200) {
        // final Map<String, dynamic> json = jsonDecode(response.body);
        return ProductModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }

  Future<LoginModel> getLogin() async {
    try {
      final response = await dio.post(
        'https://dummyjson.com/auth/login',
        data: {
          'username': 'kminchelle',
          'password': '0lelplR',
          'expiresInMins': 1
        },
      );
      if (response.statusCode == 200) {
        await AuthManager.instance.saveAccessToken(response.data['token']);
        return LoginModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load login');
      }
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }
}
