import 'dart:convert';
import 'dart:io';

import 'package:firstbank_cib/model/account_center.dart';
import 'package:http/http.dart' as http;

import '../constants/api_constants.dart';
import 'services.dart';
// import 'exceptions/app_exceptions.dart';

class AccountCenterServices {
  Future<AccountCenter> getAccountsPaged({
    required String session,
    required String username,
    required int subsidiaryId,
    required int page,
    required int recordPerPage,
  }) async {
    Uri url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.getaccountsSummary);

    Map<String, dynamic> body = {
      "session": session,
      "username": username,
      "subsidiaryId": subsidiaryId,
      "page": page,
      "recordPerPage": recordPerPage
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
          //  Deserialize into accountcenter
          final AccountCenter usersModel = AccountCenter.fromJson(responseBody);
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



/**
 * {
  "session": "rGz4Rf46ghUAPAd5BcOzHquu3zWj4OcG0d1n73YZN9t37WZn4IXuhQ9wopZ4QImedtRPp4x6RhbDhulPIiVaw",
  "username": "lukushaker@testing",
  "subsidiaryId": 2,
  "page": 1,
  "recordPerPage": 1
}
 */
