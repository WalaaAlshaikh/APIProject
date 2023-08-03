import 'package:api_project/home_controller.dart';
import 'package:api_project/home_page.dart';
import 'package:api_project/model.dart';
import 'package:api_project/order/order_controller.dart';
import 'package:api_project/order/order_screen.dart';
import 'package:api_project/service.dart';
import 'package:api_project/store_info/store_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'main.dart';

class AuthController extends GetxController {
  final service = AuthService();
  final storage = GetStorage();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();




  login() async {
    var user =
        User(password: passwordController.text, email: emailController.text,);

    await service.login(
        user: user,
        onDone: (value, value2) async {
            await storage.write('token', value.token);
           await storage.write('stores', value2["stores"]);
            passwordController.clear();
            emailController.clear();
            Get.offAll(()=> HomePage());
            print(" token 2 issssss ${storage.read("token2")}");

        },
        onError: (value) {
          Get.snackbar('Error', value);
        },onFinally: () {
        Get.close(1);
    }
    );
  }
  List<StoresModel> restoreModel() {
    final map = storage.read('stores') ?? [];
    final storing=(map as List).map((e) => StoresModel.fromJson(e)).toList();

    return storing  ;
  }

  logout() async {
    await service.logout(onDone: (value) {
      storage.remove("token");
      storage.remove("token2");
      Get.snackbar('Logout', value["message"]);
      Get.offAll(() => LoginPage());
      Get.delete<OrderController>();
      Get.delete<StoreInfoController>();
    }, onError: (value) {
      Get.snackbar('Something went wrong', value);
    }
    );
  }
  switchStore(String id) async {
    await service.switchStore(
        id: id,
        onDone: (value)async {
          await storage.write('token2', value["token"]);
          Get.offAll(()=> HomePage());
          Get.delete<OrderController>();
          Get.delete<StoreInfoController>();

        }, onError: (value) {
      Get.snackbar('Something went wrong', value);
    }

    );
  }
}
