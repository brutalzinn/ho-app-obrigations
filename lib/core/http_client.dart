import 'package:flutter_app_obrigations/core/config.dart';
import 'package:http/http.dart' as http;

class HttpClient {
  static Future<bool> makeApiCall(String data) async {
    const apiUrl = "${Config.apiUrl}/obrigation/confirm";
    final response = await http.post(Uri.parse(apiUrl), body: {'value': data});
    final success = response.statusCode == 200;
    return success;
  }
}
