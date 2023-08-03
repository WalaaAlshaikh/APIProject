import 'package:api_project/store_info/store_info_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../service.dart';

class StoreInfoController extends GetxController{

  final service=AuthService();
  final storage=GetStorage();

  bool isLoading = false;

  late final StoreInfo data;

  @override
  void onInit() async {
   await getStoreInfo();
    super.onInit();
  }


  Future getStoreInfo() async {
    await service.getStoreInfo(onDone: (value){
      data= value;
      isLoading = true;
      update();
    }, onError: (value){
      Get.snackbar('Something went wrong', value,duration:Duration(minutes: 5) );
    });

  }
}