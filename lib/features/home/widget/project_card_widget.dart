import 'package:flutter/material.dart';
import 'package:taskora/themes/colors.dart';
import 'package:taskora/themes/style.dart';

class ProjectCardWidget extends StatelessWidget {
  final String title;
  final String status;
  final double progress;
  final String risk;
  final Color color;
  final Color border;

  const ProjectCardWidget({
    super.key,
    this.title = "Taskora Mobile App",
    this.status = "On Track",
    this.progress = 0.62,
    this.risk = "High",
    this.color = AppColors.primaryBg,
    this.border = AppColors.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.bgWhite,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppStyle.h2.copyWith(fontWeight: FontWeight.bold),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.primaryBg,
                  border: Border.all(color: AppColors.border),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  status,
                  style: AppStyle.body.copyWith(fontWeight: FontWeight.bold),
                ),
              ),

              // Chip(label: Text(status)),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [Text('Task: '), Text('18')]),
              Row(children: [Text('Deadline: '), Text('22 Jun 2026')]),
              Row(children: [Text('Risk: '), Text('Medium')]),
            ],
          ),
          const SizedBox(height: 15),
          LinearProgressIndicator(
            value: progress,
            color: AppColors.primary,
            backgroundColor: AppColors.primaryBg,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Progress keseluruhan'),
              Text('${(progress * 100).toInt()}%'),
            ],
          ),
        ],
      ),
    );
  }
}
