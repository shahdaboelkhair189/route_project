import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:route_project/data/model/end_points.dart';
import 'package:route_project/data/model/response/CategoryResponse.dart';
import 'package:route_project/data/model/response/LoginResponse.dart';
import 'package:route_project/data/model/response/RegisterResponse.dart';

import 'model/request/LoginRequest.dart';
import 'model/request/RegisterRequest.dart';
/*
https://ecommerce.routemisr.com/api/v1/auth/signup
*/

class ApiManager {
  static const String baseUrl = 'ecommerce.routemisr.com';

  static Future<RegisterResponse> register(String email, String name,
      String phone, String password, String rePassword) async {
    Uri url = Uri.https(baseUrl, EndPoints.signUp);
    var registerRequest = RegisterRequest(
      name: name,
      email: email,
      password: password,
      phone: phone,
      rePassword: rePassword,
    );
    try {
      var response = await http.post(url, body: registerRequest.toJson());
      var bodyString = response.body;

      var json = jsonDecode(bodyString);
      return RegisterResponse.fromJson(json);

      /// RegisterResponse.fromJson(jsonDecode(response.body)); bdl tlt stoor
    } catch (e) {
      throw e;
    }
  }

  static Future<LoginResponse> Login(String email, String password) async {
    Uri url = Uri.https(baseUrl, EndPoints.Login);
    LoginRequest loginRequest = LoginRequest(
      email: email,
      password: password,
    );
    try {
      var response = await http.post(url, body: loginRequest.toJson());
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return LoginResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<CategoryResponse> getAllCategories() async {
    Uri url = Uri.https(baseUrl, EndPoints.getAllCategories);

    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return CategoryResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
