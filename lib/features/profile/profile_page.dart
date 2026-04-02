import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskora/themes/colors.dart';
import 'package:taskora/themes/style.dart';

import '../../utils/base_page.dart';
import 'profile_logic.dart';
import 'profile_state.dart';

class ProfilePage extends BasePage<ProfileLogic> {
  const ProfilePage({super.key});

  @override
  String get title => "Profile";

  @override
  Widget buildBody(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _sliverAppBar(),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _profileCard(),
                const SizedBox(height: 16),
                _infoSection(),
                const SizedBox(height: 16),
                _preferenceSection(),
                const SizedBox(height: 16),
                _otherSection(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _sliverAppBar() {
    return SliverAppBar(
      pinned: true,
      backgroundColor: AppColors.background,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,

      title: Text("Profil", style: AppStyle.h1),

      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.bgWhite,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.border),
            ),
            child: const Icon(
              Icons.mode_edit_outline_outlined,
              size: 20,
              color: AppColors.primaryDark,
            ),
          ),
        ),
      ],

      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Padding(
          padding: const EdgeInsets.fromLTRB(16, 100, 16, 16),
          child: _profileCard(),
        ),
      ),
    );
  }

  Widget _profileCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
      decoration: BoxDecoration(
        color: AppColors.bgWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 45,
                backgroundColor: AppColors.primary,
                child: Text(
                  "FA",
                  style: AppStyle.h1.copyWith(
                    color: AppColors.textWhite,
                    fontSize: 35,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.textWhite, width: 3),
                  ),
                  child: Icon(
                    Icons.camera_alt_outlined,
                    size: 15,
                    color: AppColors.textWhite,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text("Fatkhul Amam", style: AppStyle.h1),
          Text("fatkhulamam@taskora.id", style: AppStyle.subText),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "•",
                  style: AppStyle.h4.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  "Project Manager",
                  style: AppStyle.h4.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: AppColors.border),
            ),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  SizedBox(),
                  _StatItem(title: "Project", value: "6"),
                  VerticalDivider(color: AppColors.border, thickness: 1.5),
                  _StatItem(title: "Task Aktif", value: "28"),
                  VerticalDivider(color: AppColors.border, thickness: 1.5),
                  _StatItem(title: "On Time Rate", value: "98%"),
                  SizedBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoSection() {
    return _sectionContainer(
      title: "INFORMASI AKUN",
      children: const [
        _Tile(
          icon: Icons.person_outline,
          title: "Nama Lengkap",
          subtitle: "Fatkhul Amam",
        ),
        Divider(color: AppColors.border, thickness: 1),
        _Tile(
          icon: Icons.email_outlined,
          title: "Email",
          subtitle: "fatkhulamam@taskora.id",
        ),
        Divider(color: AppColors.border, thickness: 1),
        _Tile(
          icon: Icons.send_outlined,
          title: "Kontak",
          subtitle: "wa.me/081218263258",
          isArrow: true,
        ),
      ],
    );
  }

  Widget _preferenceSection() {
    return _sectionContainer(
      title: "PREFERENSI",
      children: [
        const SizedBox(height: 14),
        Row(
          children: [
            const SizedBox(width: 16),
            Icon(Icons.notifications_none, color: AppColors.info),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Notifikasi Push",
                    style: AppStyle.subText.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.textBlack,
                    ),
                  ),
                  Text("Peringatan risiko & deadline", style: AppStyle.caption),
                ],
              ),
            ),

            Obx(
              () => Transform.scale(
                scale: 0.8, //
                child: Switch(
                  value: controller.state.isNotifOn.value,
                  onChanged: (v) => controller.state.isNotifOn.value = v,

                  activeColor: AppColors.bgWhite,
                  activeTrackColor: AppColors.primaryDark,

                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Colors.grey.shade300,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Divider(color: AppColors.border, thickness: 1),
        const SizedBox(height: 12),
        Row(
          children: [
            const SizedBox(width: 16),
            Icon(Icons.language, color: AppColors.grey),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bahasa",
                    style: AppStyle.subText.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.grey,
                    ),
                  ),
                  Text(
                    "Bahasa Indonesia",
                    style: AppStyle.caption.copyWith(color: AppColors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Divider(color: AppColors.border, thickness: 1),
        const SizedBox(height: 12),
        Row(
          children: [
            const SizedBox(width: 16),
            Icon(Icons.email_outlined, color: AppColors.grey),
            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ringkasan Email",
                    style: AppStyle.subText.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.grey,
                    ),
                  ),
                  Text(
                    "Dikirim setiap pagi pukul 08.00",
                    style: AppStyle.caption.copyWith(color: AppColors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _otherSection() {
    return _sectionContainer(
      title: "LAINNYA",
      children: [
        ListTile(
          leading: Icon(Icons.info_outline, color: AppColors.textSecondary),
          title: Text(
            "Tentang TASKORA",
            style: AppStyle.body.copyWith(
              color: AppColors.textBlack,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Icon(Icons.chevron_right),
        ),
        Divider(color: AppColors.border, thickness: 1),
        ListTile(
          leading: Icon(Icons.lock_outline, color: AppColors.textSecondary),
          title: Text(
            "Kebijakan Privasi",
            style: AppStyle.body.copyWith(
              color: AppColors.textBlack,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Icon(Icons.chevron_right),
        ),
        Divider(color: AppColors.border, thickness: 1),
        ListTile(
          leading: Icon(
            Icons.description_outlined,
            color: AppColors.textSecondary,
          ),
          title: Text(
            "Syarat & Ketentuan",
            style: AppStyle.body.copyWith(
              color: AppColors.textBlack,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Icon(Icons.chevron_right),
        ),
      ],
    );
  }

  Widget _sectionContainer({
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
      decoration: BoxDecoration(
        color: AppColors.bgWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyle.body.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          ...children,
        ],
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final bool isArrow;

  const _Tile({
    required this.icon,
    required this.title,
    this.subtitle,
    this.isArrow = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primaryDark),
      title: Text(
        title,
        style: AppStyle.subText.copyWith(color: AppColors.primaryDark),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: AppStyle.body.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textBlack,
              ),
            )
          : null,
      trailing: isArrow ? const Icon(Icons.chevron_right) : null,
    );
  }
}

class _StatItem extends StatelessWidget {
  final String title;
  final String value;

  const _StatItem({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: AppStyle.h2),
        Text(
          title,
          style: AppStyle.caption.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
