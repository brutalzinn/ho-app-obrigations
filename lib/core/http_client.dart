import 'package:flutter_app_obrigations/core/config.dart';
import 'package:http/http.dart' as http;

class HttpClient {
  static Future<bool> makeConfirmCall(
      {required String data, required String firebaseToken, required String apiKey}) async {
    const apiUrl = "${Config.apiUrl}/mobile/obrigation/confirm";
    final response = await http.post(Uri.parse(apiUrl),
        body: {'value': data, "firebase_token": firebaseToken}, headers: {"x-api-key": apiKey});
    final success = response.statusCode == 200;
    return success;
  }

  static Future<bool> makeMobileDeviceRegisterCall(
      {required String email, required String firebaseToken, required String apiKey}) async {
    const apiUrl = "${Config.apiUrl}/mobile/register";
    final response = await http.post(Uri.parse(apiUrl),
        body: {'email': email, "firebase_token": firebaseToken}, headers: {"x-api-key": apiKey});
    final success = response.statusCode == 200;
    return success;
  }
}
