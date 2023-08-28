class Config {
  static const String apiUrl = String.fromEnvironment("API_URL", defaultValue: "http://192.168.0.81:3030");
  static const String apiKey = String.fromEnvironment("API_KEY", defaultValue: "babayaga");
}
