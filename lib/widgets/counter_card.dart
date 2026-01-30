import 'package:flutter/material.dart';

class CounterCard extends StatelessWidget {
  final String title;
  final int value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CounterCard({
    super.key,
    required this.title,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF1D1E33),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, color: Colors.grey)),
          const SizedBox(height: 10),
          Text(
            value.toString(),
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: onDecrement,
                mini: true,
                backgroundColor: const Color(0xFF4C4F5E),
                child: const Icon(Icons.remove),
              ),
              const SizedBox(width: 20),
              FloatingActionButton(
                onPressed: onIncrement,
                mini: true,
                backgroundColor: const Color(0xFF4C4F5E),
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
