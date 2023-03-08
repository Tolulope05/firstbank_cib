import 'dart:convert';

import '../constants/api_constants.dart';
import '../model/login_model.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  // auth services with getx with auth url endpoint restapi
  Future<LoginModel> loginWithUsernameAndPassword({
    required String username,
    required String password,
    required String corporateCode,
  }) async {
    Uri url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.loginUrl);
    Map body = {
      'username': username,
      'password': password,
      "ipAddress": "string",
      'macAddress': username,
      "corporateCode": corporateCode,
    };
    http.Response response = await http.post(
      url,
      body: jsonEncode(body),
      headers: ApiEndPoints.apiHeader,
    );

    if (response.statusCode == 200) {
      // Convert the response into a map & get relevant data from the response
      final responseBody = jsonDecode(response.body);
      print(responseBody);
      //  Deserialize into loginUserModel
      final LoginModel usersModel = LoginModel.fromJson(responseBody);
      return usersModel;
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
