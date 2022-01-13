// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:io';

import 'package:getx_store/home_get/home_in.dart';

// ignore: must_be_immutable
class LogInScreen extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  // ignore: prefer_final_fields
  final _globalKey = GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();

  /// stape 2
  final userdata = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 202,
        title: Text("log in"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _globalKey,
              child: Column(
                children: [
                  Text(
                    "Log In Form",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                      hintText: "email",
                    ),
                    textInputAction: TextInputAction.next,
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "not null";
                      }
                    },
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(hintText: "password"),
                    controller: _password,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "not null";
                      }
                    },
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 20,
                  ),
                  // ignore: prefer_const_constructors
                  ElevatedButton(
                      onPressed: () {
                        /// stape 4
                        String username = _email.text;
                        String password = _password.text;

                        if (_globalKey.currentState!.validate()) {
                          /// stape 3
                          userdata.write('isLogged', true);

                          ///stape 5
                          userdata.write("username", username);

                          Get.offAll(HomeScreenPAge());
                        } else {
                          Get.snackbar(
                            "error", "please enter email and password",
                            // snackPosition: SnackPosition.BOTTOM
                          );
                        }
                      },
                      // ignore: prefer_const_constructors
                      child: Text("Log In"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
