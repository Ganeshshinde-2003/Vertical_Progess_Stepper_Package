import 'package:flutter/material.dart';
import 'package:vertical_progress_stepper/vertical_progress_stepper.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('Vertical Progress Stepper Example')),
      body: VerticalProgressStepper(
        currentStep: 2,
        steps: const ["Step 1", "Step 2", "Step 3", "Step 4", "Step 5"],
        stepContent: const [
          Text('Content for Step 1'),
          Text('Content for Step 2'),
          Text('Content for Step 3'),
          Text('Content for Step 4'),
          Text('Content for Step 5')
        ],
        activeColor: Colors.blue,
        inactiveColor: Colors.grey,
        onStepTapped: (index) {
          print("Tapped on step: $index");
        },
      ),
    ),
  ));
}
