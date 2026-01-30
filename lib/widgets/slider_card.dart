import 'package:flutter/material.dart';

class SliderCard extends StatelessWidget {
  final double height;
  final ValueChanged<double> onChanged;

  const SliderCard({
    super.key,
    required this.height,
    required this.onChanged,
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
          const Text('Height', style: TextStyle(fontSize: 18, color: Colors.grey)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                height.round().toString(),
                style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const Text('cm', style: TextStyle(fontSize: 18, color: Colors.grey)),
            ],
          ),
          Slider(
            value: height,
            min: 120,
            max: 220,
            activeColor: const Color(0xFFEB1555),
            inactiveColor: Colors.grey,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
