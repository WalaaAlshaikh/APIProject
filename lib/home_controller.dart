import 'dart:io';

import 'package:api_project/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';

class HomeController extends GetxController with WidgetsBindingObserver{

  final service=AuthService();
  final storage=GetStorage();
  List productImage=[];
  List productName=[];
  List productDescription=[];
  bool isLoading = false;
  @override
  void onInit() async{
    super.onInit();
    await getProduct();
    WidgetsBinding.instance.addObserver(this);

  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        await getProduct();
        break;
      case AppLifecycleState.inactive:
      // widget is inactive
        break;
      case AppLifecycleState.paused:
      // widget is paused
        break;
      case AppLifecycleState.detached:
      // widget is detached
        break;
    }
  }


  Future getProduct() async {
    var box=GetStorage();
    String token= box.read("token");
    String lastFiveLetters=token.substring(token.length-5);
    String fileName="$lastFiveLetters.json";
    var dir =await getTemporaryDirectory();
    File file=File("${dir.path}/$fileName");
    await service.getProduct(file: file,onDone: (value){

      print(value);
      productImage=value["data"].map((e)=> e["thumbnail"]).toList();
      productName=value["data"].map((e)=> e["name"]).toList();
      productDescription=value["data"].map((e)=> e["description"]).toList();
      isLoading = true;
      update();


    }, onError: (value){
      Get.snackbar('Something went wrong', value);
    });



  }
}