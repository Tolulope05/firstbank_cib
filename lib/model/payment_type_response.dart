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

// response from initiated transfer
// To parse this JSON data, do
//
//     final paymentResponse = paymentResponseFromJson(jsonString);

InitiatePaymentResponse paymentResponseFromJson(String str) =>
    InitiatePaymentResponse.fromJson(json.decode(str));

String paymentResponseToJson(InitiatePaymentResponse data) =>
    json.encode(data.toJson());

class InitiatePaymentResponse {
  InitiatePaymentResponse({
    this.paymentResponse,
    this.success,
    this.response,
    this.responseMessage,
    this.session,
    this.message,
  });

  dynamic paymentResponse;
  bool? success;
  int? response;
  String? responseMessage;
  dynamic session;
  String? message;

  factory InitiatePaymentResponse.fromJson(Map<String, dynamic> json) =>
      InitiatePaymentResponse(
        paymentResponse: json["paymentResponse"],
        success: json["success"],
        response: json["response"],
        responseMessage: json["responseMessage"],
        session: json["session"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "paymentResponse": paymentResponse,
        "success": success,
        "response": response,
        "responseMessage": responseMessage,
        "session": session,
        "message": message,
      };
}

/// SINGLE PAYMENT MODEL
/// TO APPROVE OR REJECT SINGLE PAYMENT

SinglePaymentResponse singlePaymentResponseFromJson(String str) =>
    SinglePaymentResponse.fromJson(json.decode(str));

String singlePaymentResponseToJson(SinglePaymentResponse data) =>
    json.encode(data.toJson());

class SinglePaymentResponse {
  SinglePaymentResponse({
    this.success,
    this.response,
    this.responseMessage,
    this.session,
    this.message,
    this.totalAccounts,
    this.totalPayments,
    this.accounts,
    this.payments,
    this.tokenSerial,
  });

  bool? success;
  int? response;
  String? responseMessage;
  String? session;
  String? message;
  int? totalAccounts;
  int? totalPayments;
  List<Accountt>? accounts;
  List<Payment>? payments;
  String? tokenSerial;

  factory SinglePaymentResponse.fromJson(Map<String, dynamic> json) =>
      SinglePaymentResponse(
        success: json["success"],
        response: json["response"],
        responseMessage: json["responseMessage"],
        session: json["session"],
        message: json["message"],
        totalAccounts: json["totalAccounts"],
        totalPayments: json["totalPayments"],
        accounts: json["accounts"] == null
            ? []
            : List<Accountt>.from(
                json["accounts"]!.map((x) => Accountt.fromJson(x))),
        payments: json["payments"] == null
            ? []
            : List<Payment>.from(
                json["payments"]!.map((x) => Payment.fromJson(x))),
        tokenSerial: json["tokenSerial"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "response": response,
        "responseMessage": responseMessage,
        "session": session,
        "message": message,
        "totalAccounts": totalAccounts,
        "totalPayments": totalPayments,
        "accounts": accounts == null
            ? []
            : List<dynamic>.from(accounts!.map((x) => x.toJson())),
        "payments": payments == null
            ? []
            : List<dynamic>.from(payments!.map((x) => x.toJson())),
        "tokenSerial": tokenSerial,
      };
}

class Accountt {
  Accountt({
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
  int? overDraftBalance;
  int? ledgerBalance;
  bool? primaryAccount;
  int? telegraphicBalance;
  int? telegraphicCashBalance;
  String? bankCode;

  factory Accountt.fromJson(Map<String, dynamic> json) => Accountt(
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

class Paymentt {
  Paymentt({
    this.companyId,
    this.subsidiaryName,
    this.sourceAccountNumber,
    this.id,
    this.requestdatetime,
    this.requestDate,
    this.requestDatetimes,
    this.requestTime,
    this.valueDatetime,
    this.valueDate,
    this.datEProcessed,
    this.dateProcessed,
    this.beneficiaryName,
    this.accountNumber,
    this.bankName,
    this.banksname,
    this.bankcode,
    this.amount,
    this.charges,
    this.futureTransaction,
    this.narration,
    this.accountId,
    this.approvalStatusId,
    this.approvalStatus,
    this.approvalMessage,
    this.chargeBeneficiary,
    this.paymentStatusId,
    this.paymentStatus,
    this.paymentRemark,
    this.batchid,
    this.doclink,
    this.finalApprover,
    this.paymethodId,
    this.paymentMethod,
    this.paymentTypeId,
    this.paymentType,
    this.initiatorId,
    this.actionAllowed,
    this.approvers,
    this.initiator,
    this.remark,
    this.h2HFileName,
    this.paymentSourceId,
    this.convenienceFee,
    this.reversal,
  });

  int? companyId;
  String? subsidiaryName;
  String? sourceAccountNumber;
  int? id;
  DateTime? requestdatetime;
  String? requestDate;
  String? requestDatetimes;
  String? requestTime;
  DateTime? valueDatetime;
  String? valueDate;
  DateTime? datEProcessed;
  String? dateProcessed;
  String? beneficiaryName;
  String? accountNumber;
  String? bankName;
  String? banksname;
  String? bankcode;
  int? amount;
  int? charges;
  bool? futureTransaction;
  String? narration;
  int? accountId;
  int? approvalStatusId;
  String? approvalStatus;
  String? approvalMessage;
  bool? chargeBeneficiary;
  int? paymentStatusId;
  String? paymentStatus;
  String? paymentRemark;
  String? batchid;
  String? doclink;
  bool? finalApprover;
  int? paymethodId;
  String? paymentMethod;
  int? paymentTypeId;
  String? paymentType;
  int? initiatorId;
  bool? actionAllowed;
  List<String>? approvers;
  String? initiator;
  String? remark;
  String? h2HFileName;
  int? paymentSourceId;
  bool? convenienceFee;
  String? reversal;

  factory Paymentt.fromJson(Map<String, dynamic> json) => Paymentt(
        companyId: json["companyId"],
        subsidiaryName: json["subsidiaryName"],
        sourceAccountNumber: json["sourceAccountNumber"],
        id: json["id"],
        requestdatetime: json["requestdatetime"] == null
            ? null
            : DateTime.parse(json["requestdatetime"]),
        requestDate: json["requestDate"],
        requestDatetimes: json["requestDatetimes"],
        requestTime: json["requestTime"],
        valueDatetime: json["valueDatetime"] == null
            ? null
            : DateTime.parse(json["valueDatetime"]),
        valueDate: json["valueDate"],
        datEProcessed: json["datE_PROCESSED"] == null
            ? null
            : DateTime.parse(json["datE_PROCESSED"]),
        dateProcessed: json["dateProcessed"],
        beneficiaryName: json["beneficiaryName"],
        accountNumber: json["accountNumber"],
        bankName: json["bankName"],
        banksname: json["banksname"],
        bankcode: json["bankcode"],
        amount: json["amount"],
        charges: json["charges"],
        futureTransaction: json["futureTransaction"],
        narration: json["narration"],
        accountId: json["accountId"],
        approvalStatusId: json["approvalStatusId"],
        approvalStatus: json["approvalStatus"],
        approvalMessage: json["approvalMessage"],
        chargeBeneficiary: json["chargeBeneficiary"],
        paymentStatusId: json["paymentStatusId"],
        paymentStatus: json["paymentStatus"],
        paymentRemark: json["paymentRemark"],
        batchid: json["batchid"],
        doclink: json["doclink"],
        finalApprover: json["finalApprover"],
        paymethodId: json["paymethodId"],
        paymentMethod: json["paymentMethod"],
        paymentTypeId: json["paymentTypeId"],
        paymentType: json["paymentType"],
        initiatorId: json["initiatorId"],
        actionAllowed: json["actionAllowed"],
        approvers: json["approvers"] == null
            ? []
            : List<String>.from(json["approvers"]!.map((x) => x)),
        initiator: json["initiator"],
        remark: json["remark"],
        h2HFileName: json["h2HFileName"],
        paymentSourceId: json["paymentSourceId"],
        convenienceFee: json["convenienceFee"],
        reversal: json["reversal"],
      );

  Map<String, dynamic> toJson() => {
        "companyId": companyId,
        "subsidiaryName": subsidiaryName,
        "sourceAccountNumber": sourceAccountNumber,
        "id": id,
        "requestdatetime": requestdatetime?.toIso8601String(),
        "requestDate": requestDate,
        "requestDatetimes": requestDatetimes,
        "requestTime": requestTime,
        "valueDatetime": valueDatetime?.toIso8601String(),
        "valueDate": valueDate,
        "datE_PROCESSED": datEProcessed?.toIso8601String(),
        "dateProcessed": dateProcessed,
        "beneficiaryName": beneficiaryName,
        "accountNumber": accountNumber,
        "bankName": bankName,
        "banksname": banksname,
        "bankcode": bankcode,
        "amount": amount,
        "charges": charges,
        "futureTransaction": futureTransaction,
        "narration": narration,
        "accountId": accountId,
        "approvalStatusId": approvalStatusId,
        "approvalStatus": approvalStatus,
        "approvalMessage": approvalMessage,
        "chargeBeneficiary": chargeBeneficiary,
        "paymentStatusId": paymentStatusId,
        "paymentStatus": paymentStatus,
        "paymentRemark": paymentRemark,
        "batchid": batchid,
        "doclink": doclink,
        "finalApprover": finalApprover,
        "paymethodId": paymethodId,
        "paymentMethod": paymentMethod,
        "paymentTypeId": paymentTypeId,
        "paymentType": paymentType,
        "initiatorId": initiatorId,
        "actionAllowed": actionAllowed,
        "approvers": approvers == null
            ? []
            : List<dynamic>.from(approvers!.map((x) => x)),
        "initiator": initiator,
        "remark": remark,
        "h2HFileName": h2HFileName,
        "paymentSourceId": paymentSourceId,
        "convenienceFee": convenienceFee,
        "reversal": reversal,
      };
}
