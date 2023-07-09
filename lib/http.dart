import 'dart:convert';

import 'package:api_project/token.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as https;
import 'package:http_interceptor/http/http.dart';


class Http{
  Http._();

  static Http get http => Http._();

  final client = https.Client();
  final clientWithToken=InterceptedClient.build(interceptors: [TokenHandler()]);
  String? get baseUrl => dotenv.env['BASE_URL'];

  Future<https.Response> postRequest({
  required String endpoint,
     Map<String,dynamic>? body,
    Map<String,String>? headers,
}) async{
    return await client.post(
      Uri.parse('$baseUrl/$endpoint'),
      headers: headers,
      body: jsonEncode(body)
    );
  }

  Future<https.Response> postRequestWithToken({
    required String endpoint,
     Map<String, dynamic>? body,
    Map<String, String>? headers
  }) async {
    return await clientWithToken.post(
        Uri.parse('$baseUrl/$endpoint'),
        body: jsonEncode(body),
        headers: headers
    );
  }






}