import 'package:api_project/home_page.dart';
import 'package:api_project/model.dart';
import 'package:api_project/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'main.dart';

class AuthController extends GetxController{

  final service=AuthService();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final storage=GetStorage();

     List stores=[];
     List storesName=[];

  login ()async{
    var user= User(password: passwordController.text, email: emailController.text);
    await service.login(user: user, onDone: (value) async{
      await storage.write('token', value['token']);
      stores=value['stores'];
      storesName=stores.map((e) => e['slug'] ).toList();
      passwordController.clear();
      emailController.clear();
    }, onError: (value){
      Get.snackbar('Error', value);
    }, onFinally: (){
      Get.to(HomePage());
    });

  }

  logout()async{
    await service.logout(onDone: (value){
      print(value);
      Get.to(()=> LoginPage(title: '',));
      }, onError:(value){
      Get.snackbar('Something went wrong', value);

    } );

  }


}