import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:superwizor/models/activity_model.dart';
import 'package:superwizor/models/passengers_model.dart';

class ApiServices {
  static const url = 'http://www.boredapi.com/api/activity/';
  static const url2 = 'https://api.instantwebtools.net/v1/passenger?';

  var client = http.Client();
  Future<ActivityModel> getActivity() async {
    try {
      final response = await client.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return ActivityModel.fromJson(json);
      } else {
        throw Exception('Failed to load activity');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<PassengersModel> getPassengers({int page = 0}) async {
    try {
      final response = await client.get(
        Uri.parse(
          '${url2}page=$page&size=10',
        ),
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return PassengersModel.fromJson(json);
      } else {
        throw Exception('Failed to load activity');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
