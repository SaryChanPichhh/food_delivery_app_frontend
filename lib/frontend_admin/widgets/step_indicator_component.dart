import 'package:flutter/material.dart';
import 'package:help_app_frontend/utils/constraint.dart';

class StepIndicator extends StatelessWidget {
  final int currentStep; // which step is active (1, 2, or 3)

  const StepIndicator({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    final steps = [
      {'num': '1', 'label': 'បញ្ជីមុខម្ហូប'},
      {'num': '2', 'label': 'កន្ត្រក'},
      {'num': '3', 'label': 'ទំព័រគិតលុយ'},
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 35,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // background line
              Row(
                children: List.generate(
                  steps.length - 1,
                  (index) => Expanded(
                    child: Divider(
                      thickness: 5,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
              // circles
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: steps.map((step) {
                    final isActive = int.parse(step['num']!) <= currentStep;
                    return _stepCircle(
                      text: step['num']!,
                      backgroundColor: isActive ? Colors.black : secondaryColor,
                      textColor: isActive ? Colors.white : Colors.black,
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: steps
                .map(
                  (step) => Text(
                    step['label']!,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _stepCircle({
    required String text,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }
}
