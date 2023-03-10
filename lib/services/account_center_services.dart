import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../constants/api_constants.dart';
import '../model/model.dart';
import 'services.dart';

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
      print('ACCOUNT SUMMARY ${response.body}');
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

  Future<TransactionHistoryResponse> getTransctionHistory({
    required int accountId,
    required String session,
    required String username,
    required String startDate,
    required String enddate,
    required bool dashboard,
  }) async {
    Uri url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.getAccountHistory);

    Map<String, dynamic> body = {
      "accountId": accountId,
      "session": session,
      "username": username,
      "startDate": startDate,
      "enddate": enddate,
      "dashboard": dashboard
    };
    try {
      http.Response response = await http.post(
        url,
        body: jsonEncode(body),
        headers: ApiEndPoints.apiHeader,
      );
      print('TRANSACTION HISTORY ${response.body}');
      switch (response.statusCode) {
        case 200:
          // Convert the response into a map & get relevant data from the response
          final responseBody = jsonDecode(response.body);
          //  Deserialize into accountcenter
          final TransactionHistoryResponse usersModel =
              TransactionHistoryResponse.fromJson(responseBody);
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

  Future<WorkSpaceSummaryResponse> getWorkspaceSummary({
    required String session,
    required String username,
    required int subsidiaryId,
  }) async {
    Uri url =
        Uri.parse(ApiEndPoints.baseUrl2 + ApiEndPoints.getWorkSpacesummary);

    Map<String, dynamic> body = {
      "session": session,
      "username": username,
      "subsidiaryId": subsidiaryId,
    };
    try {
      http.Response response = await http.post(
        url,
        body: jsonEncode(body),
        headers: ApiEndPoints.apiHeader,
      );
      print('WORKSPACE SUMMARY ${response.body}');
      switch (response.statusCode) {
        case 200:
          // Convert the response into a map & get relevant data from the response
          final responseBody = jsonDecode(response.body);
          //  Deserialize into accountcenter
          final WorkSpaceSummaryResponse usersModel =
              WorkSpaceSummaryResponse.fromJson(responseBody);
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
