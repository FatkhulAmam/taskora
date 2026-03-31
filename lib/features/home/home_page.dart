import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_logic.dart';
import 'home_state.dart';

class HomePage extends StatelessWidget {
  final homeLogic = Get.find<HomeLogic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            onPressed: () {
              // =>
              //     homeLogic.logout()
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Text(
          "Welcome to Task Management App 🚀",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
