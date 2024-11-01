class ApiEndPoints {
  ApiEndPoints._();
  static final ApiEndPoints _instance = ApiEndPoints._();
  static ApiEndPoints get instance => _instance;
  static const String baseUrl = "https://staging.torliga.com/api/v1/home";
  // This Just for testing
  static const String testToken =
      "14813|l5WcBvXKig4BrcU0op4LkW7ML7ekVb2vH96Wkm6l00d96ff8";

  static const String pastMatches = "/yesterdayMatches";
  static const String upcomingMatches = "/tomorrowMatches";
  static const String todaysMatches = "/todayMatches";

  // Websocket
  static const String websocketURL =
      "wss://mqtt.staging.torliga.com/app/4bae652d93c285868d11?protocol=7&client=js&version=4.3.1&flash=false";
}
