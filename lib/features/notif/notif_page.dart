import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'notif_logic.dart';
import 'notif_state.dart';

class NotifPage extends StatelessWidget {
  const NotifPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NotifLogic logic = Get.put(NotifLogic());
    final NotifState state = Get.find<NotifLogic>().state;

    return Container();
  }
}
