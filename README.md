# Vertical Progress Stepper

A customizable vertical progress stepper widget for Flutter. This package provides an easy-to-use vertical stepper UI that can be used in any Flutter project. It allows you to display a step-by-step process where users can see their progress in a vertical layout.

## Features

- **Customizable Steps**: You can define any number of steps for your process.
- **Interactive Steps**: Users can tap to navigate through steps.
- **Custom Colors**: Customize active and inactive step colors.
- **Flexible Content**: Support for custom content for each step.
- **Optional Animation**: Option to add an animation for the step transitions.

## Installation

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  vertical_progress_stepper: ^0.0.1

# Example

The package allows you to easily integrate the `VerticalProgressStepper` widget into your app. Here is an example of how to use it:

dart
import 'package:flutter/material.dart';
import 'package:vertical_progress_stepper/vertical_progress_stepper.dart';

void main() {
  runApp(const MaterialApp(home: VerticalProgressStepperMain()));
}

class VerticalProgressStepperMain extends StatefulWidget {
  const VerticalProgressStepperMain({super.key});

  @override
  State<VerticalProgressStepperMain> createState() =>
      _VerticalProgressStepperMainState();
}

class _VerticalProgressStepperMainState
    extends State<VerticalProgressStepperMain> {
  int currentStep = 2; // Set this to any number to make it active

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom Vertical Progress Stepper")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: VerticalProgressStepper(
          currentStep: currentStep,
          steps: const [
            "Submit Lab Test",
            "Processing Lab Test",
            "Clinician Review",
            "Holistic Coach Review",
            "Results Ready",
          ],
          stepContent: const [
            Text("Please upload your lab test file or image to begin the analysis process."),
            Text("Our medical team will start analyzing your results once your lab test is submitted."),
            Text.rich(TextSpan(text: "After analysis, ", children: [
              TextSpan(text: "a clinician", style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: " will review your results within 1 week."),
            ])),
            Text("Following the clinician review, your holistic coach will provide personalized recommendations."),
            Icon(Icons.check_circle, color: Colors.green, size: 32),
          ],
          activeColor: Colors.deepPurple,
          inactiveColor: Colors.grey,
          onStepTapped: (index) {
            setState(() {
              currentStep = index;
            });
          },
        ),
      ),
    );
  }
}
```

## How It Works

- **Steps**: Each step is defined in the `steps` list.
- **Step Content**: Custom content for each step can be passed in the `stepContent` list.
- **Current Step**: The `currentStep` variable keeps track of the active step and controls the display.
- **Active & Inactive Colors**: You can customize the colors for active and inactive steps.
- **Step Navigation**: The `onStepTapped` callback allows users to change steps by tapping on them.

## Contribution

Feel free to fork, modify, and contribute to the package. Open issues for bug reports and feature requests.
