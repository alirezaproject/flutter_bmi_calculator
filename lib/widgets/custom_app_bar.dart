import 'package:bmi_calculator/configs/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.theme, required this.title, required this.appBar});

  final ThemeData theme;
  final String title;
  final AppBar appBar;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.onPrimaryContainer,
      centerTitle: true,
      title: Text(
        title,
        style: theme.textTheme.titleLarge,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
