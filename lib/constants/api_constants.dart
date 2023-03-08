class ApiEndPoints {
  static const String baseUrl =
      "https://firstdirectsandbox.firstbanknigeria.com:8443/Tesla_Auth_1b";
  static const String loginUrl = "/api/Authentication/Login_Old";
  static const Map<String, String> apiHeader = {
    "Content-Type": "application/json",
    "accept": "text/plain"
  };

  static const String logoutUrl = "/api/Authentication/Logout";
}
