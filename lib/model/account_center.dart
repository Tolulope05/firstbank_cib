// To parse this JSON data, do
//
//     final accountCenter = accountCenterFromJson(jsonString);

import 'dart:convert';

AccountCenter accountCenterFromJson(String str) =>
    AccountCenter.fromJson(json.decode(str));

String accountCenterToJson(AccountCenter data) => json.encode(data.toJson());

class AccountCenter {
  AccountCenter({
    this.totalAccounts,
    this.accountGroup,
    this.accounts,
    this.maskAccountBalance,
    this.success,
    this.response,
    this.responseMessage,
    this.session,
    this.message,
  });

  int? totalAccounts;
  List<AccountGroup>? accountGroup;
  List<Account>? accounts;
  bool? maskAccountBalance;
  bool? success;
  int? response;
  String? responseMessage;
  dynamic session;
  dynamic message;

  factory AccountCenter.fromJson(Map<String, dynamic> json) => AccountCenter(
        totalAccounts: json["totalAccounts"],
        accountGroup: json["accountGroup"] == null
            ? []
            : List<AccountGroup>.from(
                json["accountGroup"]!.map((x) => AccountGroup.fromJson(x))),
        accounts: json["accounts"] == null
            ? []
            : List<Account>.from(
                json["accounts"]!.map((x) => Account.fromJson(x))),
        maskAccountBalance: json["maskAccountBalance"],
        success: json["success"],
        response: json["response"],
        responseMessage: json["responseMessage"],
        session: json["session"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "totalAccounts": totalAccounts,
        "accountGroup": accountGroup == null
            ? []
            : List<dynamic>.from(accountGroup!.map((x) => x.toJson())),
        "accounts": accounts == null
            ? []
            : List<dynamic>.from(accounts!.map((x) => x.toJson())),
        "maskAccountBalance": maskAccountBalance,
        "success": success,
        "response": response,
        "responseMessage": responseMessage,
        "session": session,
        "message": message,
      };
}

class AccountGroup {
  AccountGroup({
    this.currency,
    this.totalAvailableBalance,
    this.totalLedgerBalance,
  });

  String? currency;
  double? totalAvailableBalance;
  double? totalLedgerBalance;

  factory AccountGroup.fromJson(Map<String, dynamic> json) => AccountGroup(
        currency: json["currency"],
        totalAvailableBalance: json["totalAvailableBalance"]?.toDouble(),
        totalLedgerBalance: json["totalLedgerBalance"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "totalAvailableBalance": totalAvailableBalance,
        "totalLedgerBalance": totalLedgerBalance,
      };
}

class Account {
  Account({
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
  double? ledgerBalance;
  bool? primaryAccount;
  double? telegraphicBalance;
  double? telegraphicCashBalance;
  String? bankCode;

  factory Account.fromJson(Map<String, dynamic> json) => Account(
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
        ledgerBalance: json["ledgerBalance"]?.toDouble(),
        primaryAccount: json["primaryAccount"],
        telegraphicBalance: json["telegraphicBalance"]?.toDouble(),
        telegraphicCashBalance: json["telegraphicCashBalance"]?.toDouble(),
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
