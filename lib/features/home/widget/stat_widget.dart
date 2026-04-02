import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskora/themes/colors.dart';
import 'package:taskora/themes/style.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.275,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.bgWhite,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: color),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(radius: 5, backgroundColor: color),
          Text(value, style: AppStyle.h1.copyWith(fontSize: 36)),
          Text(
            title,
            style: AppStyle.body.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
