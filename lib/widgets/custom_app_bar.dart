import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../resources/colors.dart';
import '../resources/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({Key? key, required this.title, this.actions, this.isBack =true}) : super(key: key);
  final String title;
  final bool isBack ;
  List<Widget>? actions;

  @override
  Size get preferredSize =>  Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: colorDarkBlue,
      backgroundColor: colorBackground,
      elevation: 0,
      centerTitle: true,
      title: Text(title, style: blueExBold20),
      leading: isBack? IconButton(
          icon: const Icon(Icons.arrow_back, color: colorDarkBlue),
          onPressed: () => Get.back()):null,
      actions: actions,
    );
  }
}
