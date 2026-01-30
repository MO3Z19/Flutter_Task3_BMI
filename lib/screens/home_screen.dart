import 'package:flutter/material.dart';
import '../widgets/gender_card.dart';
import '../widgets/slider_card.dart';
import '../widgets/counter_card.dart';
import 'result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMale = true;
  double height = 180;
  int weight = 50;
  int age = 24;

  void calculateBMI() {
    double heightInMeters = height / 100;
    double bmi = weight / (heightInMeters * heightInMeters);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(bmi: bmi),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E21),
        title: const Text('Bmindex'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GenderCard(
                    icon: Icons.male,
                    label: 'male',
                    isSelected: isMale,
                    onTap: () {
                      setState(() => isMale = true);
                    },
                  ),
                ),
                Expanded(
                  child: GenderCard(
                    icon: Icons.female,
                    label: 'female',
                    isSelected: !isMale,
                    onTap: () {
                      setState(() => isMale = false);
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SliderCard(
              height: height,
              onChanged: (value) {
                setState(() => height = value);
              },
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CounterCard(
                    title: 'Weight',
                    value: weight,
                    onIncrement: () {
                      setState(() => weight++);
                    },
                    onDecrement: () {
                      setState(() => weight--);
                    },
                  ),
                ),
                Expanded(
                  child: CounterCard(
                    title: 'age',
                    value: age,
                    onIncrement: () {
                      setState(() => age++);
                    },
                    onDecrement: () {
                      setState(() => age--);
                    },
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: calculateBMI,
            child: Container(
              width: double.infinity,
              height: 60,
              color: const Color(0xFFEB1555),
              alignment: Alignment.center,
              child: const Text(
                'Calculate',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
