import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_store/get_controllers/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeScreen'),
        centerTitle: true,
      ),
      body: GetBuilder<HomeScreenController>(
        init: HomeScreenController(),
        builder: (HomeScreenController controller) {
          if (controller.loader) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: controller.userModel.users.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(controller.userModel.users[index].firstName),
                );
              },
            );
          }
        },
      ),
    );
  }
}
