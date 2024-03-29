import 'package:bmi_calculator/widgets/pill_button.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/configs/colors.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:bmi_calculator/widgets/custom_app_bar.dart';
import 'package:bmi_calculator/widgets/gender_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMale = true;
  double height = 150;
  int age = 25;
  int weight = 70;

  updateGender(bool value) {
    setState(() {
      isMale = value;
    });
  }

  updateHeight(double value) {
    setState(() {
      height = value;
    });
  }

  updateAge(int value) {
    setState(() {
      age = value;
    });
  }

  updateWeight(int value) {
    setState(() {
      weight = value;
    });
  }

  double calculate() {
    double heightInMeter = (height / 100);
    double bmi = weight / (heightInMeter * heightInMeter);
    return bmi;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(theme: theme, title: 'BMI calculator', appBar: AppBar()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _CalculateButton(
        theme: theme,
        result: calculate(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: Column(
          children: [
            _GenderContainer(
              callback: updateGender,
              isMale: isMale,
            ),
            const SizedBox(
              height: 40,
            ),
            _HeightContainer(
              callback: updateHeight,
              height: height,
              theme: theme,
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _WeightContainer(
                  theme: theme,
                  weight: weight,
                  callback: updateWeight,
                ),
                _AgeContainer(
                  theme: theme,
                  age: age,
                  callback: updateAge,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AgeContainer extends StatelessWidget {
  final ThemeData theme;
  final int age;
  final Function(int) callback;
  const _AgeContainer({required this.theme, required this.age, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      height: 175,
      decoration: BoxDecoration(
        color: AppColors.onPrimaryContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Age',
            style: theme.textTheme.displaySmall,
          ),
          Text(
            age.toString(),
            style: theme.textTheme.displaySmall,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Pillbutton(
                icon: Icons.remove,
                callback: callback,
                value: age,
                operation: false,
              ),
              Pillbutton(
                icon: Icons.add,
                callback: callback,
                value: age,
                operation: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _WeightContainer extends StatelessWidget {
  final ThemeData theme;
  final int weight;
  final Function(int) callback;

  const _WeightContainer({required this.theme, required this.weight, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      height: 175,
      decoration: BoxDecoration(
        color: AppColors.onPrimaryContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Weight',
            style: theme.textTheme.displaySmall,
          ),
          Text(
            weight.toString(),
            style: theme.textTheme.displaySmall,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Pillbutton(
                icon: Icons.remove,
                callback: callback,
                value: weight,
                operation: false,
              ),
              Pillbutton(
                icon: Icons.add,
                callback: callback,
                value: weight,
                operation: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeightContainer extends StatelessWidget {
  final double height;
  final Function(double) callback;
  final ThemeData theme;

  const _HeightContainer({required this.height, required this.callback, required this.theme});

  @override
  Widget build(BuildContext context) {
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
              callback(value);
            },
          )
        ],
      ),
    );
  }
}

class _GenderContainer extends StatelessWidget {
  final Function(bool) callback;
  final bool isMale;
  const _GenderContainer({required this.callback, required this.isMale});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            onTap: () {
              callback(false);
            },
            child: GenderContainer(
              title: 'Female',
              isSelected: !isMale,
              icon: Icons.female,
            )),
        GestureDetector(
          onTap: () {
            callback(true);
          },
          child: GenderContainer(
            title: 'Male',
            isSelected: isMale,
            icon: Icons.male,
          ),
        ),
      ],
    );
  }
}

class _CalculateButton extends StatelessWidget {
  const _CalculateButton({
    required this.theme,
    required this.result,
  });

  final ThemeData theme;
  final double result;

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
            builder: (context) => ResultScreen(
              result: result,
            ),
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
