import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:route_project/data/model/end_points.dart';
import 'package:route_project/data/model/response/ADDCARTRESPONSE.dart';
import 'package:route_project/data/model/response/CategoryOrBrandResponse.dart';
import 'package:route_project/data/model/response/LoginResponse.dart';
import 'package:route_project/data/model/response/ProductResponse.dart';
import 'package:route_project/data/model/response/RegisterResponse.dart';
import 'package:route_project/utils/shared_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'failures.dart';
import 'model/request/LoginRequest.dart';
import 'model/request/RegisterRequest.dart';
import 'model/response/GetCartResponse.dart';
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
      var loginResponse = LoginResponse.fromJson(json);
      SharedPreferenceUtils.saveData(key: 'token', value: loginResponse.token);
      return loginResponse;
    } catch (e) {
      throw e;
    }
  }

  static Future<CategoryOrBrandResponse> getAllCategories() async {
    Uri url = Uri.https(baseUrl, EndPoints.getAllCategories);

    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return CategoryOrBrandResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<CategoryOrBrandResponse> getAllBrands() async {
    Uri url = Uri.https(baseUrl, EndPoints.getAllBrands);

    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return CategoryOrBrandResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<ProductResponse> getAllProducts() async {
    Uri url = Uri.https(baseUrl, EndPoints.getAllProducts);

    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return ProductResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<Either<Failures, Addcartresponse>> addToCart(
      String productId) async {
    Uri url = Uri.https(baseUrl, EndPoints.addToCart);

    try {
      var token = SharedPreferenceUtils.getData(key: 'token');
      var response = await http.post(url,
          body: {'productId': productId}, headers: {'token': token.toString()});
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var addToCartResponse = Addcartresponse.fromJson(json);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(addToCartResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: addToCartResponse.message!));
      } else {
        return Left(ServerError(errorMessage: addToCartResponse.message!));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));

      throw e;
    }
  }

  static Future<Either<Failures, GetCartResponse>> getCart(
      String productId) async {
    Uri url = Uri.https(baseUrl, EndPoints.addToCart);
    try {
      var token = SharedPreferenceUtils.getData(key: 'token');
      var response = await http.get(url, headers: {'token': token.toString()});
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var getCartResponse = GetCartResponse.fromJson(json);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(getCartResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: getCartResponse.message!));
      } else {
        return Left(ServerError(errorMessage: getCartResponse.message!));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  static Future<Either<Failures, GetCartResponse>> deleteItemInCart(
      String productId) async {
    Uri url = Uri.https(baseUrl, '${EndPoints.addToCart}/$productId');
    try {
      var token = SharedPreferenceUtils.getData(key: 'token');
      var response =
          await http.delete(url, headers: {'token': token.toString()});
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var deleteItemInCart = GetCartResponse.fromJson(json);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(deleteItemInCart);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: deleteItemInCart.message!));
      } else {
        return Left(ServerError(errorMessage: deleteItemInCart.message!));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  static Future<Either<Failures, GetCartResponse>> updateCountInCart(
      String productId, int count) async {
    Uri url = Uri.https(baseUrl, '${EndPoints.addToCart}/$productId');
    try {
      var token = SharedPreferenceUtils.getData(key: 'token');
      var response = await http.put(url,
          headers: {'token': token.toString()}, body: {'count': '$count'});
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var updateCountInCartResponse = GetCartResponse.fromJson(json);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(updateCountInCartResponse);
      } else if (response.statusCode == 401) {
        return Left(
            ServerError(errorMessage: updateCountInCartResponse.message!));
      } else {
        return Left(
            ServerError(errorMessage: updateCountInCartResponse.message!));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }
}