import 'package:bmi_calculator/configs/colors.dart';
import 'package:flutter/material.dart';

class Pillbutton extends StatelessWidget {
  final IconData icon;
  final Function(int) callback;
  final int value;
  final bool operation;
  const Pillbutton({super.key, required this.icon, required this.callback, required this.value, required this.operation});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (operation) {
          callback(value + 1);
        } else {
          callback(value - 1);
        }
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xffE5E5E5)),
        child: Icon(
          icon,
          color: AppColors.backgroundColor,
        ),
      ),
    );
  }
}
