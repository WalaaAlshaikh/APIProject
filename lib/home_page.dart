import 'package:api_project/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);

  final controller =Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ListView.builder(shrinkWrap: true,itemBuilder: (context,index){
            return Text(controller.storesName[index]);
          },itemCount: controller.storesName.length,),

          const SizedBox(height: 50,),
          ElevatedButton(onPressed: ()async{
            controller.logout();
          }, child: const Text("Logout"))
        ],
      ),
    ),


    );
  }
}
