import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskora/features/home/widget/project_card_widget.dart';
import 'package:taskora/features/home/widget/risk_card_widget.dart';
import 'package:taskora/features/home/widget/stat_widget.dart';
import 'package:taskora/themes/colors.dart';
import 'package:taskora/themes/style.dart';

import '../../utils/base_page.dart';
import 'home_logic.dart';
import 'home_state.dart';

class HomePage extends BasePage<HomeLogic> {
  @override
  bool get safeArea => true;

  @override
  String get title => 'HOME';

  @override
  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _header(),
          const SizedBox(height: 20),
          _statSection(),
          const SizedBox(height: 20),
          const RiskCardWidget(),
          const SizedBox(height: 20),
          _projectHeader(),
          const SizedBox(height: 15),
          const ProjectCardWidget(),
          const SizedBox(height: 15),
          const ProjectCardWidget(
            title: "E-Commerce Web",
            status: "On Hold",
            progress: 0.36,
            risk: "Medium",
          ),
        ],
      ),
    );
  }

  Widget _header() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Selamat Pagi!",
                  style: AppStyle.h3.copyWith(color: AppColors.textSecondary),
                ),
                SizedBox(height: 4),
                Text(
                  "Fatkhul Amam",
                  style: AppStyle.h1.copyWith(color: AppColors.textBlack),
                ),
              ],
            ),
            CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.primary,
              child: Text(
                "FA",
                style: AppStyle.h1.copyWith(color: AppColors.textWhite),
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          children: [
            Expanded(child: Divider(color: AppColors.border, thickness: 1)),
            const SizedBox(width: 10),
            Text(
              "Project Manager",
              style: AppStyle.body.copyWith(
                color: AppColors.textSecondary,
                fontSize: 16,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(child: Divider(color: AppColors.border, thickness: 1)),
          ],
        ),
      ],
    );
  }

  Widget _statSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        StatCard(title: "Project Active", value: "3", color: AppColors.success),
        StatCard(title: "Task Pending", value: "15", color: AppColors.warning),
        StatCard(title: "Due Date", value: "3", color: AppColors.danger),
      ],
    );
  }

  Widget _projectHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'My Project',
          style: AppStyle.h2.copyWith(fontWeight: FontWeight.bold),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Row(
            children: [
              Icon(Icons.add_box_outlined, color: AppColors.bgWhite),
              SizedBox(width: 5),
              Text(
                'Buat Project',
                style: AppStyle.body.copyWith(
                  color: AppColors.bgWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
