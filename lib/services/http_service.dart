
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:watch_app/core/utils/api_constants.dart';
import 'package:watch_app/core/utils/app_string.dart';
import 'package:watch_app/model/product_list_model.dart';
import 'package:watch_app/model/signup.dart';
//
class HttpService {


  static Future<AuthModel?> uesrSignUp(String firstName,String lastName,String email,String username,String password,) async {
    try {
      var response = await http.post(
        Uri.parse(AppApis.signUp),
        body: {
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'username': username,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        return AuthModel.fromJson(jsonDecode(response.body));
      } else
        return null;
    }
    catch (e) {
      print(e);
      return null;
    }
  }
  static Future<AuthModel?> userLogin(String username,String userPassword,) async {
    try {
      var response = await http.post(
        Uri.parse(AppApis.login),
        body: {
          'username': username,
          'user_password': userPassword,
        },
      );
      if (response.statusCode == 200) {
        return AuthModel.fromJson(jsonDecode(response.body));
      } else
        return null;
    }
    catch (e) {
      print(e);
      return null;
    }
  }



  static Future<List<Categories>?> getCategories() async {
    try {
      var response = await http.get(
        Uri.parse(AppApis.categories),

      );
      if (response.statusCode == 200) {
        List rawList = jsonDecode(response.body);
        return rawList.map((json) => Categories.fromJson(json)).toList();

      } else
        return null;
    }
    catch (e) {
      return null;
    }
  }
}