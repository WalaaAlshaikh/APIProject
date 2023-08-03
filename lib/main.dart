import 'package:api_project/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';

import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final getStorage = GetStorage();

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:
      getStorage.read("token") != null? HomePage() :
      LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatelessWidget {
   LoginPage({super.key, });


  final controller=Get.put(AuthController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Api Project"),
      ),
      body: GetBuilder<AuthController>(
        builder: (authController){
          return
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: authController.emailController,
                  ),
                  TextField(
                    controller: authController.passwordController,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: ElevatedButton(onPressed: ()async{
                        authController.login();
                    }, child: Text("login")),
                  )

                ],
              ),
            );

        }

      ),
    );
  }
}
