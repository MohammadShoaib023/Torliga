class ApiEndPoints {
  ApiEndPoints._();
  static final ApiEndPoints _instance = ApiEndPoints._();
  static ApiEndPoints get instance => _instance;
  static const String baseUrl = "https://staging.torliga.com/api/v1/home";
  static const String pastMatches = "/yesterdayMatches";
  static const String upcomingMatches = "/tomorrowMatches";
  static const String todaysMatches = "/todayMatches";
}
