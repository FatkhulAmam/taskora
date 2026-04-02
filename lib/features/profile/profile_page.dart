import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'profile_logic.dart';
import 'profile_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileLogic logic = Get.put(ProfileLogic());
    final ProfileState state = Get.find<ProfileLogic>().state;

    return Container();
  }
}
