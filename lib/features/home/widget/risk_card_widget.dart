import 'package:flutter/material.dart';
import 'package:taskora/themes/colors.dart';
import 'package:taskora/themes/style.dart';

class RiskCardWidget extends StatelessWidget {
  const RiskCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.bgWhite,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.danger),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.danger,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.warning_amber, color: Colors.white),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Risiko Terdeteksi",
                  style: AppStyle.body.copyWith(
                    color: AppColors.danger,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Taskora Mobile App",
                  style: AppStyle.body.copyWith(
                    color: AppColors.danger,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Deadline 3 hari lagi, 40% task belum mulai",
                  style: AppStyle.body.copyWith(
                    color: AppColors.danger,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: AppColors.danger,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text("HIGH", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
