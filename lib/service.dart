import 'dart:convert';

import 'package:api_project/http.dart';
import 'package:api_project/model.dart';
import 'package:http/http.dart';

class AuthService {
  login(
      {required User user,
      required Function(dynamic value) onDone,
      required Function(String value) onError,
      required Function() onFinally}) async {
    try {
      Response response = await Http.http.postRequest(
          endpoint: 'auth/login',
          body: {'email': user.email, 'password': user.password},
          headers: {'Accept': 'application/json'});
      var result = await jsonDecode(response.body);
      if (response.statusCode.toString().startsWith('2')) {
        onDone(result);
      } else if (response.statusCode.toString().startsWith('4')) {
        onError(result['message']);
      } else {
        onError('Please contact us');
      }
    } catch (e) {
      onError(e.toString());
    } finally {
      onFinally();
    }
  }

  logout({
    required Function(dynamic value) onDone,
    required Function(String value) onError,
  }) async {
    try {
      
      Response response =await Http.http.postRequestWithToken(endpoint: 'auth/logout');
      var result = await jsonDecode(response.body);
      if (response.statusCode.toString().startsWith('2')) {
        onDone(result);
      } else if (response.statusCode.toString().startsWith('4')) {
        onError(result['message']);
      }  else {
        onError('Please contact us');
      }

    } catch (e) {
      onError(e.toString());
    }
  }
}
