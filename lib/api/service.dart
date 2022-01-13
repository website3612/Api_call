import 'dart:convert';

import 'package:getx_store/model/user_model.dart';
import 'package:http/http.dart' as http;

class API {
  static Future<UserModel> getUser() async {
    http.Response response =
        await http.get(Uri.parse('http://192.168.29.200:5000/user'));
    print(response.body);
    return UserModel.fromJson(jsonDecode(response.body));
  }
}
