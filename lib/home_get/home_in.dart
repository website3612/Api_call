// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

import 'log_in.dart';

class HomeScreenPAge extends StatefulWidget {
  const HomeScreenPAge({Key? key}) : super(key: key);

  @override
  _HomeScreenPAgeState createState() => _HomeScreenPAgeState();
}

class _HomeScreenPAgeState extends State<HomeScreenPAge> {
  /// stape 6
  final userdata = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                Text(
                  "user data ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  /// stape 7
                  "name: ${userdata.read("username")}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                    onPressed: () {
                      /// stape 8

                      userdata.write("isLogged", false);

                      /// stape 9
                      userdata.remove("username");

                      /// stape 10
                      Get.offAll(LogInScreen());
                    },
                    child: Text("log out"))
              ],
            ),
          )
        ],
      ),
    );
  }
}
