import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_store/api/service.dart';
import 'package:getx_store/model/user_model.dart';

class HomeScreenController extends GetxController {
  bool loader = true;
  late UserModel _userModel;

  UserModel get userModel => _userModel;

  @override
  void onInit() {
    print("hello");
    Timer.periodic(Duration(seconds: 5), (timer) {
      reGet();
    });
    getData();
    super.onInit();
  }

  Future<void> reGet() async {
    _userModel = await API.getUser();
    update();
  }

  Future<void> getData() async {
    print('getdata');
    _userModel = await API.getUser();
    print("_userModel.users.length ${_userModel.users.length}");
    if (_userModel != null) {
      loader = false;
      update();
    }
  }
}
