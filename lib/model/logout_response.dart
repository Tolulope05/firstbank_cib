// To parse this JSON data, do
//
//     final logoutResponse = logoutResponseFromJson(jsonString);

import 'dart:convert';

LogoutResponse logoutResponseFromJson(String str) =>
    LogoutResponse.fromJson(json.decode(str));

String logoutResponseToJson(LogoutResponse data) => json.encode(data.toJson());

class LogoutResponse {
  LogoutResponse({
    required this.success,
    required this.response,
    required this.responseMessage,
    this.session,
    this.message,
  });

  bool success;
  int response;
  String responseMessage;
  dynamic session;
  dynamic message;

  factory LogoutResponse.fromJson(Map<String, dynamic> json) => LogoutResponse(
        success: json["success"],
        response: json["response"],
        responseMessage: json["responseMessage"],
        session: json["session"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "response": response,
        "responseMessage": responseMessage,
        "session": session,
        "message": message,
      };
}
