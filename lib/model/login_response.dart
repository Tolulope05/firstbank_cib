import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.success,
    this.changePassword,
    this.response,
    this.responseMessage,
    this.fullname,
    this.session,
    this.getSubsidiaries,
    this.advert,
    this.tokenRequired,
    this.lastLogin,
    this.firstTime,
    this.token,
  });

  bool? success;
  bool? changePassword;
  int? response;
  String? responseMessage;
  String? fullname;
  String? session;
  List<GetSubsidiary>? getSubsidiaries;
  bool? advert;
  bool? tokenRequired;
  String? lastLogin;
  bool? firstTime;
  String? token;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        success: json["success"],
        changePassword: json["changePassword"],
        response: json["response"],
        responseMessage: json["responseMessage"],
        fullname: json["fullname"],
        session: json["session"],
        getSubsidiaries: json["getSubsidiaries"] == null
            ? []
            : List<GetSubsidiary>.from(
                json["getSubsidiaries"]!.map((x) => GetSubsidiary.fromJson(x))),
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
        "getSubsidiaries": getSubsidiaries == null
            ? []
            : List<dynamic>.from(getSubsidiaries!.map((x) => x.toJson())),
        "advert": advert,
        "tokenRequired": tokenRequired,
        "lastLogin": lastLogin,
        "firstTime": firstTime,
        "token": token,
      };
}

class GetSubsidiary {
  GetSubsidiary({
    this.subsidiaryId,
    this.subsidiaryName,
    this.userRole,
    this.userRoles,
    this.suspense,
    this.seeBalance,
    this.payOnlyApprovedBeneficiaries,
    this.getModules,
  });

  int? subsidiaryId;
  String? subsidiaryName;
  List<UserRole>? userRole;
  String? userRoles;
  String? suspense;
  bool? seeBalance;
  bool? payOnlyApprovedBeneficiaries;
  List<GetModule>? getModules;

  factory GetSubsidiary.fromJson(Map<String, dynamic> json) => GetSubsidiary(
        subsidiaryId: json["subsidiaryId"],
        subsidiaryName: json["subsidiaryName"],
        userRole: json["userRole"] == null
            ? []
            : List<UserRole>.from(
                json["userRole"]!.map((x) => UserRole.fromJson(x))),
        userRoles: json["userRoles"],
        suspense: json["suspense"],
        seeBalance: json["seeBalance"],
        payOnlyApprovedBeneficiaries: json["payOnlyApprovedBeneficiaries"],
        getModules: json["getModules"] == null
            ? []
            : List<GetModule>.from(
                json["getModules"]!.map((x) => GetModule.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "subsidiaryId": subsidiaryId,
        "subsidiaryName": subsidiaryName,
        "userRole": userRole == null
            ? []
            : List<dynamic>.from(userRole!.map((x) => x.toJson())),
        "userRoles": userRoles,
        "suspense": suspense,
        "seeBalance": seeBalance,
        "payOnlyApprovedBeneficiaries": payOnlyApprovedBeneficiaries,
        "getModules": getModules == null
            ? []
            : List<dynamic>.from(getModules!.map((x) => x.toJson())),
      };
}

class GetModule {
  GetModule({
    this.id,
    this.modulename,
    this.moduleUrl,
    this.arrangement,
    this.allowed,
    this.getSubModules,
  });

  int? id;
  String? modulename;
  dynamic moduleUrl;
  int? arrangement;
  bool? allowed;
  List<GetSubModule>? getSubModules;

  factory GetModule.fromJson(Map<String, dynamic> json) => GetModule(
        id: json["id"],
        modulename: json["modulename"],
        moduleUrl: json["moduleUrl"],
        arrangement: json["arrangement"],
        allowed: json["allowed"],
        getSubModules: json["getSubModules"] == null
            ? []
            : List<GetSubModule>.from(
                json["getSubModules"]!.map((x) => GetSubModule.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "modulename": modulename,
        "moduleUrl": moduleUrl,
        "arrangement": arrangement,
        "allowed": allowed,
        "getSubModules": getSubModules == null
            ? []
            : List<dynamic>.from(getSubModules!.map((x) => x.toJson())),
      };
}

class GetSubModule {
  GetSubModule({
    this.id,
    this.subModuleName,
    this.subModuleUrl,
    this.arrangement,
    this.allowed,
  });

  int? id;
  String? subModuleName;
  dynamic subModuleUrl;
  int? arrangement;
  bool? allowed;

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
    this.id,
    this.rolename,
  });

  int? id;
  String? rolename;

  factory UserRole.fromJson(Map<String, dynamic> json) => UserRole(
        id: json["id"],
        rolename: json["rolename"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rolename": rolename,
      };
}
