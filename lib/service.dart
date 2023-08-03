import 'dart:convert';
import 'dart:io';

import 'package:api_project/http.dart';
import 'package:api_project/model.dart';
import 'package:api_project/order/order_model.dart';
import 'package:api_project/store_info/store_info_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

class AuthService {

  final storage=GetStorage();
  login({
    required User user,
    required Function(dynamic value, dynamic value2) onDone,
    required Function(String value) onError,
    required Function() onFinally,


  }) async {
    try {
      var response = await Http.http.postRequest(
          endpoint: 'auth/login',
          body: {'email': user.email, 'password': user.password},
          headers: {'Content-Type': 'application/json'});

      var result = await jsonDecode(response.body);
     LoginResponse loginResponse = LoginResponse.fromJson(result);
      if (response.statusCode.toString().startsWith('2')) {
        onDone(loginResponse,loginResponse.toJson());
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
      Response response =
          await Http.http.postRequestWithToken(endpoint: 'auth/logout');
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
    }
  }

  switchStore({
    required Function(dynamic value) onDone,
    required Function(String value) onError,
    required String id
  }) async {
    try {
      Response response =
          await Http.http.postRequestWithToken(endpoint: 'switch-store/$id');
      var result = await jsonDecode(response.body);
      if (response.statusCode.toString().startsWith('2')) {
        print(result);
        onDone(result);
      } else if (response.statusCode.toString().startsWith('4')) {
        onError(result['message']);
      } else {
        onError('Please contact us');
      }
    } catch (e) {
      onError(e.toString());
    }
  }

  getProduct({
    required Function(dynamic value) onDone,
    required Function(String value) onError,
    File? file,
  }) async {
    try {
      if (file!.existsSync()) {
        print("Reading from cache");
        // read from cache
        final data = file.readAsStringSync();
        final res = await jsonDecode(data);
        onDone(res);
      } else {
        print("Fetching from network");
        Response response =
            await Http.http.getRequestWithToken(endpoint: 'products');

        var result = await jsonDecode(response.body);
        if (response.statusCode.toString().startsWith('2')) {
          //save to json cache file
          file.writeAsStringSync(response.body,
              flush: true, mode: FileMode.write);
          onDone(result);
        } else if (response.statusCode.toString().startsWith('4')) {
          onError(result['message']);
        } else {
          onError('Please contact us');
        }
      }
    } catch (e) {
      onError(e.toString());
    }
  }

  getOrders({
    required Function(dynamic value) onDone,
    required Function(String value) onError,

  }) async {
    try {

      Response response = storage.read("token2")!=null?
            await Http.http.getRequestWithToken2(endpoint: 'orders'):
      await Http.http.getRequestWithToken(endpoint: 'orders');

        var result = await jsonDecode(response.body);
      Order orderResponse = Order.fromJson(result);

      if (response.statusCode.toString().startsWith('2')) {



          onDone(orderResponse);
        } else if (response.statusCode.toString().startsWith('4')) {
          onError(result['message']);
        } else {
          onError('Please contact us');
        }

    } catch (e) {
      onError(e.toString());
    }

}

getStoreInfo({
    required Function(dynamic value) onDone,
    required Function(String value) onError,

  }) async {
    try {

      Response response =storage.read("token2")!=null?
            await Http.http.getRequestWithToken2(endpoint: 'me'):
            await Http.http.getRequestWithToken(endpoint: 'me');
        var result = await jsonDecode(response.body);
      StoreInfo storeInfoResponse = StoreInfo.fromJson(result);

      if (response.statusCode.toString().startsWith('2')) {

          onDone(storeInfoResponse);
        } else if (response.statusCode.toString().startsWith('4')) {
          onError(result['message']);
        } else {
          onError('Please contact us');
        }

    } catch (e) {
      onError(e.toString());
    }

}



}
