import 'package:bmi_calculator/configs/colors.dart';
import 'package:flutter/material.dart';

class GenderContainer extends StatelessWidget {
  const GenderContainer({super.key, required this.title, required this.isSelected, required this.icon});

  final String title;
  final bool isSelected;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 175,
      height: 175,
      decoration: BoxDecoration(
        color: isSelected ? Colors.white.withOpacity(0.45) : AppColors.onPrimaryContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 50,
          ),
          Text(
            title,
            style: theme.textTheme.displaySmall,
          ),
        ],
      ),
    );
  }
}
