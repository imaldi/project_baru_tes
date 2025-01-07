import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:project_baru_tes/utils/consts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/failures/failures.dart';

class LoginRepository {
  Future<Either<RestApiFailure, bool>> login(
      String email, String password) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString(tokenKey);
      var dio = Dio();
      var formData = {"email": email, "password": password};
      var request = await dio.post(
        'http://ptro.site/api/auth/token',
        data: formData,
        options: Options(
          contentType: Headers.jsonContentType,
          validateStatus: (statusCode) {
            if (statusCode == 200 ||
                statusCode == 201 ||
                statusCode == 400 ||
                statusCode == 404) return true;
            return false;
          },
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': "Bearer $token",
          },
        ),
      );

      var responseData = request.data;
      var respCode = request.statusCode;
      print("respCode: $respCode");
      print("responseData: $responseData");

      var returnedData = respCode == 200;

      if (returnedData) {
        prefs.setBool(isLoggedIn, true);
        return Right(returnedData);
      }
      return Left(RestApiFailure(code: 403, errorMessage: "Gagal Autentikasi"));
    } on DioException catch (e) {
      print("Error Login: ${e}");
      return Left(RestApiFailure(code: 500, errorMessage: e.toString()));
    }
  }
}
