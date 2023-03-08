import 'dart:convert';
import 'dart:io';

import 'package:firstbank_cib/model/model.dart';
import 'package:firstbank_cib/services/exceptions/app_exceptions.dart';

import '../constants/api_constants.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  Future<LoginResponse> loginWithUsernameAndPassword({
    required String username,
    required String password,
    required String corporateCode,
  }) async {
    Uri url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.loginUrl);

    Map<String, dynamic> body = {
      'username': username,
      'password': password,
      'ipAddress': 'string',
      'macAddress': username,
      'corporateCode': corporateCode,
    };
    try {
      http.Response response = await http.post(
        url,
        body: jsonEncode(body),
        headers: ApiEndPoints.apiHeader,
      );
      print(response.body);

      switch (response.statusCode) {
        case 200:
          // Convert the response into a map & get relevant data from the response
          final responseBody = jsonDecode(response.body);
          print(responseBody);
          //  Deserialize into loginUserModel
          final LoginResponse usersModel = LoginResponse.fromJson(responseBody);
          return usersModel;
        case 400:
          throw BadRequestException(response.body.toString());
        case 403:
          throw UnauthorisedException(response.body.toString());

        default:
          throw FetchDataException(
              'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
      }
    } on SocketException {
      throw FetchDataException("No Internet connection");
    } catch (e) {
      throw FetchDataException(e.toString());
    }
  }

  // logout service with username and session to api
  Future<LogoutResponse> logoutUser({
    required String username,
    required String session,
  }) async {
    Uri url = Uri.parse(
      '${ApiEndPoints.baseUrl}${ApiEndPoints.logoutUrl}/$username/$session',
    );

    try {
      http.Response response = await http.get(
        url,
        headers: ApiEndPoints.apiHeader,
      );
      print(response.body);

      switch (response.statusCode) {
        case 200:
          // Convert the response into a map & get relevant data from the response
          final responseBody = jsonDecode(response.body);
          print(responseBody);
          //  Deserialize into loginUserModel
          final LogoutResponse usersModel =
              LogoutResponse.fromJson(responseBody);
          return usersModel;
        case 400:
          throw BadRequestException(response.body.toString());
        case 403:
          throw UnauthorisedException(response.body.toString());

        default:
          throw FetchDataException(
              'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
      }
    } on SocketException {
      throw FetchDataException("No Internet connection");
    } catch (e) {
      throw FetchDataException(e.toString());
    }
  }
}
