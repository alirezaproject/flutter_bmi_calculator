import 'package:bmi_calculator/configs/colors.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:bmi_calculator/widgets/custom_app_bar.dart';
import 'package:bmi_calculator/widgets/gender_container.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(theme: theme, title: 'BMI calculator', appBar: AppBar()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _CalculateButton(theme: theme),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: Column(
          children: [
            const _GenderContainer(),
            const SizedBox(
              height: 40,
            ),
            _HeightContainer(),
          ],
        ),
      ),
    );
  }
}

class _HeightContainer extends StatefulWidget {
  const _HeightContainer();

  @override
  State<_HeightContainer> createState() => _HeightContainerState();
}

class _HeightContainerState extends State<_HeightContainer> {
  double height = 150;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.onPrimaryContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'HEIGHT',
                style: theme.textTheme.displaySmall,
              ),
              Text(
                'cm',
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Slider(
            value: height,
            min: 70,
            max: 250,
            divisions: 250 - 70,
            label: height.round().toString(),
            onChanged: (value) {
              setState(() {
                height = value.roundToDouble();
              });
            },
          )
        ],
      ),
    );
  }
}

class _GenderContainer extends StatelessWidget {
  const _GenderContainer();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GenderContainer(title: 'Female', isSelected: true, icon: Icons.female),
        GenderContainer(title: 'Male', isSelected: false, icon: Icons.male),
      ],
    );
  }
}

class _CalculateButton extends StatelessWidget {
  const _CalculateButton({
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: FloatingActionButton.extended(
        backgroundColor: AppColors.primaryColor,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const ResultScreen(),
          ));
        },
        label: Text(
          'CALCULATE',
          style: theme.textTheme.displaySmall,
        ),
      ),
    );
  }
}
