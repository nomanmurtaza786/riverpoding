import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:superwizor/models/activity_model.dart';

class ApiServices {
  static const url = 'http://www.boredapi.com/api/activity/';
  var client = http.Client();
  Future<ActivityModel> getActivity() async {
    try {
      final response = await client.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return ActivityModel.fromJson(json);
      } else {
        throw Exception('Failed to load activity');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
