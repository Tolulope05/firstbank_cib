import 'dart:convert';
import 'dart:io';

import '../constants/api_constants.dart';
import '../model/model.dart';
import 'package:http/http.dart' as http;

import 'exceptions/app_exceptions.dart';

class SubidiairiesServices {
  Future<GetSubsidiary> getSubsidiaries({
    required String session,
    required String username,
    required int subsidiaryId,
  }) async {
    var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.getSubsidiaryInfo);

    Map<String, dynamic> body = {
      'session': session,
      'username': username,
      'subsidiaryId': subsidiaryId,
    };

    print(session);
    print(username);
    print(subsidiaryId);

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
          //  Deserialize into loginUserModel
          final GetSubsidiary usersModel = GetSubsidiary.fromJson(responseBody);
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
  "session": "string",
  "username": "string",
  "subsidiaryId": 0
}
 */
