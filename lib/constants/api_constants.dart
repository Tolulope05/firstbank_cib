class ApiEndPoints {
  static const String baseUrl =
      "https://firstdirectsandbox.firstbanknigeria.com:8443/Tesla_Auth_1b";

  static const String baseUrl2 =
      "https://firstdirectsandbox.firstbanknigeria.com:8443/Tesla_Payment_1b";
  static const String loginUrl = "/api/Authentication/Login_Old";
  static const Map<String, String> apiHeader = {
    "Content-Type": "application/json",
    "accept": "text/plain"
  };

  static const String logoutUrl = "/api/Authentication/Logout";
  static const String getSubsidiaryInfo =
      "/api/Authentication/GetSubsidiaryInfo";

  static const String getaccountsSummary =
      "/api/AccountCenter/GetAccountsPaged";

  static const String getAccountHistory =
      "/api/AccountCenter/GetTransactionHistory";

  static const String getWorkSpacesummary = "/api/Payment/GetPaymentDashboard";
}
