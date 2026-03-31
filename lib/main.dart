import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskora/routes/app_routes.dart';

import 'core/bindings/initial_binding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TASKORA APP',
      initialBinding: InitialBinding(),
      initialRoute: Routes.SPLASH,
      getPages: AppPages.pages,
    );
  }
}
