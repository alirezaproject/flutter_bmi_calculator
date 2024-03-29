import 'package:bmi_calculator/configs/colors.dart';
import 'package:bmi_calculator/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double result;
  const ResultScreen({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    Color resultTextColor = Colors.white;
    String showResult(double value) {
      if (value < 18.5) {
        resultTextColor = Colors.yellow;
        return 'Underweight';
      } else if (value >= 18.5 && value < 25) {
        resultTextColor = Colors.green;
        return 'Normal';
      } else if (value >= 25 && value < 30) {
        resultTextColor = Colors.orange;
        return 'Over weight';
      } else {
        resultTextColor = Colors.red;
        return 'Obesity';
      }
    }

    final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        theme: theme,
        title: 'Your Result',
        appBar: AppBar(),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 100, horizontal: 30),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.onPrimaryContainer,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              showResult(result),
              style: theme.textTheme.titleLarge!.copyWith(color: resultTextColor),
            ),
            Text(
              result.toStringAsFixed(1),
              style: theme.textTheme.titleLarge!.copyWith(fontSize: 70),
            ),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}
