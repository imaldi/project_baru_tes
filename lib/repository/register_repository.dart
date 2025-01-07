import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import '../core/failures/failures.dart';

class RegisterRepository {
  Future<Either<RestApiFailure, bool>> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String role,
    required String phone,
    required String address,
    String? referralCode,
  }) async {
    try {
      var dio = Dio();
      var formData = {
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation,
        "role": role,
        "phone": phone,
        "address": address,
        if (referralCode != null) "referral_code": referralCode,
      };

      var request = await dio.post(
        'http://ptro.site/api/auth/signup',
        data: jsonEncode(formData),
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
          },
        ),
      );

      var responseData = request.data;
      var respCode = request.statusCode;

      log("respCode: $respCode");
      log("responseData: $responseData");

      if (respCode == 201) {
        return const Right(true);
      } else {
        return Left(RestApiFailure(
            code: respCode!, errorMessage: responseData["message"] ?? ""));
      }
    } on DioException catch (e) {
      log("Error Register: ${e.message}");
      return Left(RestApiFailure(code: 500, errorMessage: e.toString()));
    }
  }
}
