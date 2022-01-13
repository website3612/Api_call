import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_store/getx_demo/splash_screen.dart';

import 'get_storage/homepage_screen.dart';
import 'get_storage/log_in.dart';
import 'get_storage/loginpage_screen.dart';
import 'home_get/log_in.dart';

void main() async {
  /// stape 1
  await GetStorage.init();
  // ignore: prefer_const_constructors
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen());
  }
}

/// stape 8
// class MainScreen extends StatefulWidget {
//   const MainScreen({Key? key}) : super(key: key);
//
//   @override
//   _MainScreenState createState() => _MainScreenState();
// }
//
// class _MainScreenState extends State<MainScreen> {
//   ///stape 11
//   final userdata = GetStorage();
//   @override
//   // ignore: must_call_super
//   void initState() {
//     super.initState();
//
//     ///stape 112
//     userdata.writeIfNull("isLogged", false);
//
//     /// stape 113
//     Future.delayed(Duration.zero, () async {
//       userdata.read("isLogged")
//           ? Get.offAll(DashBoard())
//           : Get.offAll(LogInScreen());
//     });
//   }
//
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
