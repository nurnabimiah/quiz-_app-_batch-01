class ApiEndpoints {
  // Base URL for API
  static const String baseUrl = 'https://opentdb.com';

  // Timeout durations
  static const int receiveTimeout = 15000; // 15 seconds
  static const int connectionTimeout = 15000; // 15 seconds

  // OpenTDB Endpoints
  static const String openTdbCategoryUrl = '$baseUrl/api_category.php';
  static const String openTdbQuestionUrl = '/api.php';
}
