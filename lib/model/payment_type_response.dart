// To parse this JSON data, do
//
//     final localPaymentResponse = localPaymentResponseFromJson(jsonString);

import 'dart:convert';

LocalPaymentResponse localPaymentResponseFromJson(String str) =>
    LocalPaymentResponse.fromJson(json.decode(str));

String localPaymentResponseToJson(LocalPaymentResponse data) =>
    json.encode(data.toJson());

class LocalPaymentResponse {
  LocalPaymentResponse({
    this.accounts,
    this.beneficiaries,
    this.suggestedAmount,
    this.paymentMethod,
    this.paymentType,
    this.bankList,
    this.limit,
    this.tokenSerial,
    this.success,
    this.response,
    this.responseMessage,
    this.session,
    this.message,
  });

  List<BankAccount>? accounts;
  List<Beneficiary>? beneficiaries;
  List<int>? suggestedAmount;
  List<Payment>? paymentMethod;
  List<Payment>? paymentType;
  List<BankList>? bankList;
  Limit? limit;
  String? tokenSerial;
  bool? success;
  int? response;
  String? responseMessage;
  String? session;
  dynamic message;

  factory LocalPaymentResponse.fromJson(Map<String, dynamic> json) =>
      LocalPaymentResponse(
        accounts: json["accounts"] == null
            ? []
            : List<BankAccount>.from(
                json["accounts"]!.map((x) => BankAccount.fromJson(x))),
        beneficiaries: json["beneficiaries"] == null
            ? []
            : List<Beneficiary>.from(
                json["beneficiaries"]!.map((x) => Beneficiary.fromJson(x))),
        suggestedAmount: json["suggestedAmount"] == null
            ? []
            : List<int>.from(json["suggestedAmount"]!.map((x) => x)),
        paymentMethod: json["paymentMethod"] == null
            ? []
            : List<Payment>.from(
                json["paymentMethod"]!.map((x) => Payment.fromJson(x))),
        paymentType: json["paymentType"] == null
            ? []
            : List<Payment>.from(
                json["paymentType"]!.map((x) => Payment.fromJson(x))),
        bankList: json["bankList"] == null
            ? []
            : List<BankList>.from(
                json["bankList"]!.map((x) => BankList.fromJson(x))),
        limit: json["limit"] == null ? null : Limit.fromJson(json["limit"]),
        tokenSerial: json["tokenSerial"],
        success: json["success"],
        response: json["response"],
        responseMessage: json["responseMessage"],
        session: json["session"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "accounts": accounts == null
            ? []
            : List<dynamic>.from(accounts!.map((x) => x.toJson())),
        "beneficiaries": beneficiaries == null
            ? []
            : List<dynamic>.from(beneficiaries!.map((x) => x.toJson())),
        "suggestedAmount": suggestedAmount == null
            ? []
            : List<dynamic>.from(suggestedAmount!.map((x) => x)),
        "paymentMethod": paymentMethod == null
            ? []
            : List<dynamic>.from(paymentMethod!.map((x) => x.toJson())),
        "paymentType": paymentType == null
            ? []
            : List<dynamic>.from(paymentType!.map((x) => x.toJson())),
        "bankList": bankList == null
            ? []
            : List<dynamic>.from(bankList!.map((x) => x.toJson())),
        "limit": limit?.toJson(),
        "tokenSerial": tokenSerial,
        "success": success,
        "response": response,
        "responseMessage": responseMessage,
        "session": session,
        "message": message,
      };
}

class BankAccount {
  BankAccount({
    this.accountId,
    this.accountType,
    this.accountName,
    this.preferredName,
    this.bankName,
    this.accountNumber,
    this.status,
    this.currency,
    this.availableBalance,
    this.overDraftBalance,
    this.ledgerBalance,
    this.primaryAccount,
    this.telegraphicBalance,
    this.telegraphicCashBalance,
    this.bankCode,
  });

  int? accountId;
  String? accountType;
  String? accountName;
  String? preferredName;
  String? bankName;
  String? accountNumber;
  String? status;
  String? currency;
  double? availableBalance;
  dynamic overDraftBalance;
  dynamic ledgerBalance;
  bool? primaryAccount;
  int? telegraphicBalance;
  int? telegraphicCashBalance;
  String? bankCode;

  factory BankAccount.fromJson(Map<String, dynamic> json) => BankAccount(
        accountId: json["accountId"],
        accountType: json["accountType"],
        accountName: json["accountName"],
        preferredName: json["preferredName"],
        bankName: json["bankName"],
        accountNumber: json["accountNumber"],
        status: json["status"],
        currency: json["currency"],
        availableBalance: json["availableBalance"]?.toDouble(),
        overDraftBalance: json["overDraftBalance"],
        ledgerBalance: json["ledgerBalance"],
        primaryAccount: json["primaryAccount"],
        telegraphicBalance: json["telegraphicBalance"],
        telegraphicCashBalance: json["telegraphicCashBalance"],
        bankCode: json["bankCode"],
      );

  Map<String, dynamic> toJson() => {
        "accountId": accountId,
        "accountType": accountType,
        "accountName": accountName,
        "preferredName": preferredName,
        "bankName": bankName,
        "accountNumber": accountNumber,
        "status": status,
        "currency": currency,
        "availableBalance": availableBalance,
        "overDraftBalance": overDraftBalance,
        "ledgerBalance": ledgerBalance,
        "primaryAccount": primaryAccount,
        "telegraphicBalance": telegraphicBalance,
        "telegraphicCashBalance": telegraphicCashBalance,
        "bankCode": bankCode,
      };
}

class BankList {
  BankList({
    this.bankCode,
    this.bankName,
  });

  String? bankCode;
  String? bankName;

  factory BankList.fromJson(Map<String, dynamic> json) => BankList(
        bankCode: json["bankCode"],
        bankName: json["bankName"],
      );

  Map<String, dynamic> toJson() => {
        "bankCode": bankCode,
        "bankName": bankName,
      };
}

class Beneficiary {
  Beneficiary({
    this.subsidiaryName,
    this.beneficiaryId,
    this.alias,
    this.accountName,
    this.accountNumber,
    this.email,
    this.phoneNumber,
    this.statusId,
    this.status,
    this.error,
    this.bankCode,
    this.bankName,
  });

  dynamic subsidiaryName;
  int? beneficiaryId;
  String? alias;
  String? accountName;
  String? accountNumber;
  String? email;
  String? phoneNumber;
  int? statusId;
  String? status;
  dynamic error;
  String? bankCode;
  String? bankName;

  factory Beneficiary.fromJson(Map<String, dynamic> json) => Beneficiary(
        subsidiaryName: json["subsidiaryName"],
        beneficiaryId: json["beneficiaryId"],
        alias: json["alias"],
        accountName: json["accountName"],
        accountNumber: json["accountNumber"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        statusId: json["statusId"],
        status: json["status"],
        error: json["error"],
        bankCode: json["bankCode"],
        bankName: json["bankName"],
      );

  Map<String, dynamic> toJson() => {
        "subsidiaryName": subsidiaryName,
        "beneficiaryId": beneficiaryId,
        "alias": alias,
        "accountName": accountName,
        "accountNumber": accountNumber,
        "email": email,
        "phoneNumber": phoneNumber,
        "statusId": statusId,
        "status": status,
        "error": error,
        "bankCode": bankCode,
        "bankName": bankName,
      };
}

class Limit {
  Limit({
    this.dailyLimit,
    this.outstandingLimit,
    this.allowedForTransactions,
    this.singleLimit,
  });

  int? dailyLimit;
  int? outstandingLimit;
  bool? allowedForTransactions;
  num? singleLimit; //single transaction limit is a double and int ??

  factory Limit.fromJson(Map<String, dynamic> json) => Limit(
        dailyLimit: json["dailyLimit"],
        outstandingLimit: json["outstandingLimit"],
        allowedForTransactions: json["allowedForTransactions"],
        singleLimit: json["singleLimit"],
      );

  Map<String, dynamic> toJson() => {
        "dailyLimit": dailyLimit,
        "outstandingLimit": outstandingLimit,
        "allowedForTransactions": allowedForTransactions,
        "singleLimit": singleLimit,
      };
}

class Payment {
  Payment({
    this.id,
    this.value,
    this.remark,
  });

  int? id;
  String? value;
  dynamic remark;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        id: json["id"],
        value: json["value"],
        remark: json["remark"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
        "remark": remark,
      };
}
