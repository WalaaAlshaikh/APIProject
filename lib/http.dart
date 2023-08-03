import 'dart:convert';

import 'package:api_project/token.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as https;
import 'package:http_interceptor/http/http.dart';


class Http{
  Http._();

  static Http get http => Http._();

  final client = https.Client();
  final clientWithToken=InterceptedClient.build(interceptors: [TokenHandler(tokenKey: "token")]);
  final clientWithToken2=InterceptedClient.build(interceptors: [TokenHandler(tokenKey: "token2")]);
  String? get baseUrl => dotenv.env['BASE_URL'];

  Future<https.Response> postRequest({
  required String endpoint,
  required Map<String,dynamic>? body,
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

  Future<https.Response> postRequestWithToken2({
    required String endpoint,
     Map<String, dynamic>? body,
    Map<String, String>? headers
  }) async {
    return await clientWithToken2.post(
        Uri.parse('$baseUrl/$endpoint'),
        body: jsonEncode(body),
        headers: headers
    );
  }

  //GET request
  Future<https.Response> getRequest({
    required String? endpoint,
    Map<String, String>? headers,
  }) async {
    return await client.get(
      Uri.parse('$baseUrl/$endpoint'),
      headers: headers,
    );
  }

  //GET request with token
  Future<https.Response> getRequestWithToken({
    required String? endpoint,
  }) async {
    return await clientWithToken.get(
      Uri.parse('$baseUrl/$endpoint'),
    );
  }
  Future<https.Response> getRequestWithToken2({
    required String? endpoint,
  }) async {
    return await clientWithToken2.get(
      Uri.parse('$baseUrl/$endpoint'),
    );
  }






}