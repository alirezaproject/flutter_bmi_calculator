import 'package:bmi_calculator/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        theme: theme,
        title: 'Your Result',
        appBar: AppBar(),
      ),
    );
  }
}
