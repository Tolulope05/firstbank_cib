// To parse this JSON data, do
//
//     final workSpaceSummaryResponse = workSpaceSummaryResponseFromJson(jsonString);

import 'dart:convert';

WorkSpaceSummaryResponse workSpaceSummaryResponseFromJson(String str) =>
    WorkSpaceSummaryResponse.fromJson(json.decode(str));

String workSpaceSummaryResponseToJson(WorkSpaceSummaryResponse data) =>
    json.encode(data.toJson());

class WorkSpaceSummaryResponse {
  WorkSpaceSummaryResponse({
    this.completedTransaction,
    this.pendingTransaction,
    this.rejectTransaction,
    this.totalTransaction,
    this.success,
    this.response,
    this.responseMessage,
    this.session,
    this.message,
  });

  int? completedTransaction;
  int? pendingTransaction;
  int? rejectTransaction;
  int? totalTransaction;
  bool? success;
  int? response;
  String? responseMessage;
  dynamic session;
  dynamic message;

  factory WorkSpaceSummaryResponse.fromJson(Map<String, dynamic> json) =>
      WorkSpaceSummaryResponse(
        completedTransaction: json["completedTransaction"],
        pendingTransaction: json["pendingTransaction"],
        rejectTransaction: json["rejectTransaction"],
        totalTransaction: json["totalTransaction"],
        success: json["success"],
        response: json["response"],
        responseMessage: json["responseMessage"],
        session: json["session"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "completedTransaction": completedTransaction,
        "pendingTransaction": pendingTransaction,
        "rejectTransaction": rejectTransaction,
        "totalTransaction": totalTransaction,
        "success": success,
        "response": response,
        "responseMessage": responseMessage,
        "session": session,
        "message": message,
      };
}
