// To parse this JSON data, do
//
//     final transactionHistoryResponse = transactionHistoryResponseFromJson(jsonString);

import 'dart:convert';

TransactionHistoryResponse transactionHistoryResponseFromJson(String str) =>
    TransactionHistoryResponse.fromJson(json.decode(str));

String transactionHistoryResponseToJson(TransactionHistoryResponse data) =>
    json.encode(data.toJson());

class TransactionHistoryResponse {
  TransactionHistoryResponse({
    this.response,
    this.responseMessage,
    this.success,
    this.result,
    this.transactionSummary,
  });

  int? response;
  String? responseMessage;
  bool? success;
  List<Result>? result;
  TransactionSummary? transactionSummary;

  factory TransactionHistoryResponse.fromJson(Map<String, dynamic> json) =>
      TransactionHistoryResponse(
        response: json["response"],
        responseMessage: json["responseMessage"],
        success: json["success"],
        result: json["result"] == null
            ? []
            : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
        transactionSummary: json["transactionSummary"] == null
            ? null
            : TransactionSummary.fromJson(json["transactionSummary"]),
      );

  Map<String, dynamic> toJson() => {
        "response": response,
        "responseMessage": responseMessage,
        "success": success,
        "result": result == null
            ? []
            : List<dynamic>.from(result!.map((x) => x.toJson())),
        "transactionSummary": transactionSummary?.toJson(),
      };
}

class Result {
  Result({
    this.transId,
    this.instrument,
    this.transDate,
    this.valueDate,
    this.narration,
    this.transAmount,
    this.drcr,
    this.channel,
    this.balance,
    this.transactionReference,
    this.recordTime,
    this.requestDate,
    this.requestTime,
    this.transAmountString,
    this.balanceString,
  });

  String? transId;
  dynamic instrument;
  String? transDate;
  String? valueDate;
  String? narration;
  double? transAmount;
  String? drcr;
  String? channel;
  int? balance;
  String? transactionReference;
  DateTime? recordTime;
  String? requestDate;
  String? requestTime;
  String? transAmountString;
  String? balanceString;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        transId: json["transId"],
        instrument: json["instrument"],
        transDate: json["transDate"],
        valueDate: json["valueDate"],
        narration: json["narration"],
        transAmount: json["transAmount"]?.toDouble(),
        drcr: json["drcr"],
        channel: json["channel"],
        balance: json["balance"],
        transactionReference: json["transactionReference"],
        recordTime: json["recordTime"] == null
            ? null
            : DateTime.parse(json["recordTime"]),
        requestDate: json["requestDate"],
        requestTime: json["requestTime"],
        transAmountString: json["transAmountString"],
        balanceString: json["balanceString"],
      );

  Map<String, dynamic> toJson() => {
        "transId": transId,
        "instrument": instrument,
        "transDate": transDate,
        "valueDate": valueDate,
        "narration": narration,
        "transAmount": transAmount,
        "drcr": drcr,
        "channel": channel,
        "balance": balance,
        "transactionReference": transactionReference,
        "recordTime": recordTime?.toIso8601String(),
        "requestDate": requestDate,
        "requestTime": requestTime,
        "transAmountString": transAmountString,
        "balanceString": balanceString,
      };
}

class TransactionSummary {
  TransactionSummary({
    this.totalTransactionCount,
    this.totalDebitCount,
    this.totalCreditCount,
    this.totalDebit,
    this.totalCredit,
    this.accountName,
    this.accountAddress,
    this.preferredName,
    this.accountNumber,
    this.currency,
    this.accountClass,
    this.openingBalance,
    this.closingBalance,
    this.clearedBalance,
    this.unClearedBalance,
    this.startDate,
    this.endDate,
  });

  int? totalTransactionCount;
  int? totalDebitCount;
  int? totalCreditCount;
  double? totalDebit;
  double? totalCredit;
  String? accountName;
  dynamic accountAddress;
  dynamic preferredName;
  String? accountNumber;
  String? currency;
  String? accountClass;
  double? openingBalance;
  int? closingBalance;
  int? clearedBalance;
  int? unClearedBalance;
  DateTime? startDate;
  DateTime? endDate;

  factory TransactionSummary.fromJson(Map<String, dynamic> json) =>
      TransactionSummary(
        totalTransactionCount: json["totalTransactionCount"],
        totalDebitCount: json["totalDebitCount"],
        totalCreditCount: json["totalCreditCount"],
        totalDebit: json["totalDebit"]?.toDouble(),
        totalCredit: json["totalCredit"]?.toDouble(),
        accountName: json["accountName"],
        accountAddress: json["accountAddress"],
        preferredName: json["preferredName"],
        accountNumber: json["accountNumber"],
        currency: json["currency"],
        accountClass: json["accountClass"],
        openingBalance: json["openingBalance"]?.toDouble(),
        closingBalance: json["closingBalance"],
        clearedBalance: json["clearedBalance"],
        unClearedBalance: json["unClearedBalance"],
        startDate: json["startDate"] == null
            ? null
            : DateTime.parse(json["startDate"]),
        endDate:
            json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
      );

  Map<String, dynamic> toJson() => {
        "totalTransactionCount": totalTransactionCount,
        "totalDebitCount": totalDebitCount,
        "totalCreditCount": totalCreditCount,
        "totalDebit": totalDebit,
        "totalCredit": totalCredit,
        "accountName": accountName,
        "accountAddress": accountAddress,
        "preferredName": preferredName,
        "accountNumber": accountNumber,
        "currency": currency,
        "accountClass": accountClass,
        "openingBalance": openingBalance,
        "closingBalance": closingBalance,
        "clearedBalance": clearedBalance,
        "unClearedBalance": unClearedBalance,
        "startDate": startDate?.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
