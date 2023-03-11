import 'dart:convert';
import 'dart:io';

import '../constants/api_constants.dart';
import '../model/model.dart';
import "package:http/http.dart" as http;

import 'services.dart';

class Paymentservices {
  Future<LocalPaymentResponse> getLocalPayment({
    required String session,
    required String username,
    required int subsidiaryId,
  }) async {
    Uri url = Uri.parse(ApiEndPoints.baseUrl2 + ApiEndPoints.getLocalPayment);
    Map<String, dynamic> body = {
      "session": session,
      "username": username,
      "subsidiaryId": subsidiaryId,
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
      print('LOCAL PAYMENT ${response.body}');
      switch (response.statusCode) {
        case 200:
          // Convert the response into a map & get relevant data from the response
          final responseBody = jsonDecode(response.body);
          //  Deserialize into localPaymentResponse
          final LocalPaymentResponse usersModel =
              LocalPaymentResponse.fromJson(responseBody);
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

  Future<InitiatePaymentResponse> initiatePayment({
    required String session,
    required String username,
    required int charges,
    required int sourceAccountId,
    required int subsidiaryId,
    int? paymentMethod, // 0 = account, 1 = card
    int? paymentType, // 0 = debit, 1 = credit
    required String bankCode,
    required String bankName,
    required String recieverAccountNumber,
    required String recieverName,
    required bool saveBeneficiary,
    required int amount,
    required String memo,
    required String dateTime,
  }) async {
    Uri url = Uri.parse(ApiEndPoints.baseUrl2 + ApiEndPoints.initiatePayment);
    Map<String, dynamic> body = {
      "session": session,
      "username": username,
      "subsidiaryId": subsidiaryId,
      "enableMultipleDebit": true,
      "docByteArray": "string",
      "docExtension": "string",
      "request": [
        {
          "accountId": sourceAccountId,
          "paymentMethod": paymentMethod,
          "paymentType": paymentType,
          "bankCode": bankCode,
          "bankName": bankName,
          "charges": charges,
          "accountNumber": recieverAccountNumber,
          "prefferedName": recieverName,
          "transactionRef": " REF: ${DateTime.now().toIso8601String()}",
          "saveBeneficiary": saveBeneficiary,
          "amount": amount,
          "notifyCustomer": true,
          "chargeBeneficiary": true,
          "narration": memo,
          "phoneNumber": null,
          "email": null,
          "valueDate": dateTime,
        }
      ]
    };

    // print(jsonEncode(body));

    try {
      http.Response response = await http.post(
        url,
        body: jsonEncode(body),
        headers: ApiEndPoints.apiHeader,
      );
      print('INITIATE PAYMENT RES ${response.body}');
      switch (response.statusCode) {
        case 200:
          // Convert the response into a map & get relevant data from the response
          final responseBody = jsonDecode(response.body);
          //  Deserialize into localPaymentResponse
          final InitiatePaymentResponse usersModel =
              InitiatePaymentResponse.fromJson(responseBody);
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

  /// THIS IS FOR ACTion Center
  Future<SinglePaymentResponse> getSinglePaymentResp({
    required String session,
    required String username,
    required int subsidiaryId,
    required bool reportPage,
  }) async {
    // This is for Accout summary
    Uri url =
        Uri.parse(ApiEndPoints.baseUrl2 + ApiEndPoints.actionCeterConfirmation);
    Map<String, dynamic> body = {
      "session": session,
      "username": username,
      "subsidiaryId": subsidiaryId,
      "reportPage": reportPage,
    };

    try {
      http.Response response = await http.post(
        url,
        body: jsonEncode(body),
        headers: ApiEndPoints.apiHeader,
      );
      print('SINGLE PAYMENT SUMMARY ${response.body}');
      switch (response.statusCode) {
        case 200:
          // Convert the response into a map & get relevant data from the response
          final responseBody = jsonDecode(response.body);
          //  Deserialize into localPaymentResponse
          final SinglePaymentResponse usersModel =
              SinglePaymentResponse.fromJson(responseBody);
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

  // GET ACCOUNT NUMBER DETAILS //  // THE VALIDATE ACCOUNT RESPONSE DOESNT HAVE ACCOUNT BALLANCE // // SO I USED THE GET ACCOUNT NUMBER DETAILS
  Future<ValidateAccountResponse> getAccountNumberStatus({
    required String session,
    required String destinationAccount,
    required int subsidiaryId,
  }) async {
    // This is for Accout summary
    Uri url =
        Uri.parse(ApiEndPoints.baseUrl2 + ApiEndPoints.validateAccountNum);
    Map<String, dynamic> body = {
      "session": session,
      "destinationAccount": destinationAccount,
      "destinationBankCode": subsidiaryId,
    };

    try {
      http.Response response = await http.post(
        url,
        body: jsonEncode(body),
        headers: ApiEndPoints.apiHeader,
      );
      print('GET ACCOUNT NUMBER DETAILS ${response.body}');
      switch (response.statusCode) {
        case 200:
          // Convert the response into a map & get relevant data from the response
          final responseBody = jsonDecode(response.body);
          //  Deserialize into localPaymentResponse
          final ValidateAccountResponse usersModel =
              ValidateAccountResponse.fromJson(responseBody);
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

  Future<ApprovePaymentResponse> approvePayment({
    required String session,
    required String username,
    required int paymentId,
    required String? batchId,
    required String token,
    required bool approve,
  }) async {
    // This is for Accout summary
    Uri url = Uri.parse(ApiEndPoints.baseUrl2 + ApiEndPoints.approvePayment);
    Map<String, dynamic> body = {
      "session": session,
      "username": username,
      "paymentId": [
        {
          "paymentId": paymentId,
          "approve": approve,
          "rejectReason": "string",
        }
      ],
      "batchId": batchId,
      "token": token,
    };

    try {
      http.Response response = await http.post(
        url,
        body: jsonEncode(body),
        headers: ApiEndPoints.apiHeader,
      );
      print('APPROVE PAYMENT ${response.body}');
      switch (response.statusCode) {
        case 200:
          // Convert the response into a map & get relevant data from the response
          final responseBody = jsonDecode(response.body);
          //  Deserialize into localPaymentResponse
          final ApprovePaymentResponse usersModel =
              ApprovePaymentResponse.fromJson(responseBody);
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
