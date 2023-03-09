// To parse this JSON data, do
//
//     final accountCenter = accountCenterFromJson(jsonString);

import 'dart:convert';

AccountCenter accountCenterFromJson(String str) =>
    AccountCenter.fromJson(json.decode(str));

String accountCenterToJson(AccountCenter data) => json.encode(data.toJson());

class AccountCenter {
  AccountCenter({
    required this.totalAccounts,
    required this.accountGroup,
    required this.accounts,
    required this.maskAccountBalance,
    required this.success,
    required this.response,
    required this.responseMessage,
    this.session,
    this.message,
  });

  int totalAccounts;
  List<AccountGroup> accountGroup;
  List<Account> accounts;
  bool maskAccountBalance;
  bool success;
  int response;
  String responseMessage;
  String? session;
  String? message;

  factory AccountCenter.fromJson(Map<String, dynamic> json) => AccountCenter(
        totalAccounts: json["totalAccounts"],
        accountGroup: List<AccountGroup>.from(
            json["accountGroup"].map((x) => AccountGroup.fromJson(x))),
        accounts: List<Account>.from(
            json["accounts"].map((x) => Account.fromJson(x))),
        maskAccountBalance: json["maskAccountBalance"],
        success: json["success"],
        response: json["response"],
        responseMessage: json["responseMessage"],
        session: json["session"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "totalAccounts": totalAccounts,
        "accountGroup": List<dynamic>.from(accountGroup.map((x) => x.toJson())),
        "accounts": List<dynamic>.from(accounts.map((x) => x.toJson())),
        "maskAccountBalance": maskAccountBalance,
        "success": success,
        "response": response,
        "responseMessage": responseMessage,
        "session": session ?? "",
        "message": message ?? "",
      };
}

class AccountGroup {
  AccountGroup({
    required this.currency,
    required this.totalAvailableBalance,
    required this.totalLedgerBalance,
  });

  String currency;
  double totalAvailableBalance;
  double totalLedgerBalance;

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
    required this.accountId,
    required this.accountType,
    required this.accountName,
    required this.preferredName,
    required this.bankName,
    required this.accountNumber,
    required this.status,
    required this.currency,
    required this.availableBalance,
    required this.overDraftBalance,
    required this.ledgerBalance,
    required this.primaryAccount,
    required this.telegraphicBalance,
    required this.telegraphicCashBalance,
    required this.bankCode,
  });

  int accountId;
  String accountType;
  String accountName;
  String preferredName;
  String bankName;
  String accountNumber;
  String status;
  String currency;
  double availableBalance;
  int overDraftBalance;
  double ledgerBalance;
  bool primaryAccount;
  double telegraphicBalance;
  double telegraphicCashBalance;
  String bankCode;

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
