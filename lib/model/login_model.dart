// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.success,
    required this.changePassword,
    required this.response,
    required this.responseMessage,
    required this.fullname,
    required this.session,
    required this.getSubsidiaries,
    required this.advert,
    required this.tokenRequired,
    required this.lastLogin,
    required this.firstTime,
    required this.token,
  });

  bool success;
  bool changePassword;
  int response;
  String responseMessage;
  String fullname;
  String session;
  List<GetSubsidiary> getSubsidiaries;
  bool advert;
  bool tokenRequired;
  String lastLogin;
  bool firstTime;
  String token;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        success: json["success"],
        changePassword: json["changePassword"],
        response: json["response"],
        responseMessage: json["responseMessage"],
        fullname: json["fullname"],
        session: json["session"],
        getSubsidiaries: List<GetSubsidiary>.from(
            json["getSubsidiaries"].map((x) => GetSubsidiary.fromJson(x))),
        advert: json["advert"],
        tokenRequired: json["tokenRequired"],
        lastLogin: json["lastLogin"],
        firstTime: json["firstTime"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "changePassword": changePassword,
        "response": response,
        "responseMessage": responseMessage,
        "fullname": fullname,
        "session": session,
        "getSubsidiaries":
            List<dynamic>.from(getSubsidiaries.map((x) => x.toJson())),
        "advert": advert,
        "tokenRequired": tokenRequired,
        "lastLogin": lastLogin,
        "firstTime": firstTime,
        "token": token,
      };
}

class GetSubsidiary {
  GetSubsidiary({
    required this.subsidiaryId,
    required this.subsidiaryName,
    required this.userRole,
    required this.userRoles,
    this.suspense,
    required this.seeBalance,
    required this.payOnlyApprovedBeneficiaries,
    required this.getModules,
  });

  int subsidiaryId;
  String subsidiaryName;
  List<UserRole> userRole;
  String userRoles;
  String? suspense;
  bool seeBalance;
  bool payOnlyApprovedBeneficiaries;
  List<GetModule> getModules;

  factory GetSubsidiary.fromJson(Map<String, dynamic> json) => GetSubsidiary(
        subsidiaryId: json["subsidiaryId"],
        subsidiaryName: json["subsidiaryName"],
        userRole: List<UserRole>.from(
            json["userRole"].map((x) => UserRole.fromJson(x))),
        userRoles: json["userRoles"],
        suspense: json["suspense"],
        seeBalance: json["seeBalance"],
        payOnlyApprovedBeneficiaries: json["payOnlyApprovedBeneficiaries"],
        getModules: List<GetModule>.from(
            json["getModules"].map((x) => GetModule.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "subsidiaryId": subsidiaryId,
        "subsidiaryName": subsidiaryName,
        "userRole": List<dynamic>.from(userRole.map((x) => x.toJson())),
        "userRoles": userRoles,
        "suspense": suspense,
        "seeBalance": seeBalance,
        "payOnlyApprovedBeneficiaries": payOnlyApprovedBeneficiaries,
        "getModules": List<dynamic>.from(getModules.map((x) => x.toJson())),
      };
}

class GetModule {
  GetModule({
    required this.id,
    required this.modulename,
    this.moduleUrl,
    required this.arrangement,
    required this.allowed,
    required this.getSubModules,
  });

  int id;
  String modulename;
  dynamic moduleUrl;
  int arrangement;
  bool allowed;
  List<GetSubModule> getSubModules;

  factory GetModule.fromJson(Map<String, dynamic> json) => GetModule(
        id: json["id"],
        modulename: json["modulename"],
        moduleUrl: json["moduleUrl"],
        arrangement: json["arrangement"],
        allowed: json["allowed"],
        getSubModules: List<GetSubModule>.from(
            json["getSubModules"].map((x) => GetSubModule.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "modulename": modulename,
        "moduleUrl": moduleUrl,
        "arrangement": arrangement,
        "allowed": allowed,
        "getSubModules":
            List<dynamic>.from(getSubModules.map((x) => x.toJson())),
      };
}

class GetSubModule {
  GetSubModule({
    required this.id,
    required this.subModuleName,
    this.subModuleUrl,
    required this.arrangement,
    required this.allowed,
  });

  int id;
  String subModuleName;
  dynamic subModuleUrl;
  int arrangement;
  bool allowed;

  factory GetSubModule.fromJson(Map<String, dynamic> json) => GetSubModule(
        id: json["id"],
        subModuleName: json["subModuleName"],
        subModuleUrl: json["subModuleUrl"],
        arrangement: json["arrangement"],
        allowed: json["allowed"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subModuleName": subModuleName,
        "subModuleUrl": subModuleUrl,
        "arrangement": arrangement,
        "allowed": allowed,
      };
}

class UserRole {
  UserRole({
    required this.id,
    required this.rolename,
  });

  int id;
  String rolename;

  factory UserRole.fromJson(Map<String, dynamic> json) => UserRole(
        id: json["id"],
        rolename: json["rolename"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rolename": rolename,
      };
}
