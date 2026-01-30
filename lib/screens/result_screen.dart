import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double bmi;

  const ResultScreen({super.key, required this.bmi});

  String getCategory() {
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 25) return 'NORMAL';
    if (bmi < 30) return 'Overweight';
    return 'Obese';
  }

  String getMessage() {
    if (bmi < 18.5) return 'You need to eat more';
    if (bmi < 25) return 'your body weight is absolutely normal, Good job! 👍';
    if (bmi < 30) return 'You need to exercise more';
    return 'Please consult a doctor';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E21),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Your result',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1D1E33),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    getCategory(),
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    bmi.toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      getMessage(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: double.infinity,
              height: 60,
              color: const Color(0xFFEB1555),
              alignment: Alignment.center,
              child: const Text(
                'Recalculate',
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
