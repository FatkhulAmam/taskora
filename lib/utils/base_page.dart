import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../themes/colors.dart';

abstract class BasePage<T extends GetxController> extends GetView<T> {
  const BasePage({super.key});

  String get title;

  bool get useAppBar => false;

  bool get safeArea => true;

  bool get resizeToAvoidBottomInset => true;

  Color get backgroundColor => AppColors.background;

  SystemUiOverlayStyle get overlayStyle => const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  );

  Widget buildBody(BuildContext context);

  Widget? buildLoading() => null;

  @override
  Widget build(BuildContext context) {
    final body = buildBody(context);

    Widget content = safeArea ? SafeArea(child: body) : body;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlayStyle,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,

        appBar: useAppBar
            ? AppBar(
                title: Text(title),
                centerTitle: true,
                elevation: 0,
                backgroundColor: backgroundColor,
                foregroundColor: Colors.black,
              )
            : null,

        body: Stack(
          children: [
            content,
            if (buildLoading() != null) buildLoading()!,
          ],
        ),
      ),
    );
  }
}
