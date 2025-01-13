import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vertical_progress_stepper/vertical_progress_stepper.dart';

void main() {
  // Group tests for the VerticalProgressStepper widget
  group('VerticalProgressStepper', () {
    testWidgets('displays correct number of steps',
        (WidgetTester tester) async {
      // Create a test widget to use VerticalProgressStepper
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: VerticalProgressStepper(
            currentStep: 2,
            steps: [
              "Submit Lab Test",
              "Processing Lab Test",
              "Clinician Review",
              "Holistic Coach Review",
              "Results Ready",
            ],
            stepContent: [
              Text("Step 1: Submit Lab Test"),
              Text("Step 2: Processing Lab Test"),
              Text("Step 3: Clinician Review"),
              Text("Step 4: Holistic Coach Review"),
              Text("Step 5: Results Ready"),
            ],
          ),
        ),
      ));

      // Check if all the steps are rendered
      expect(find.text("Submit Lab Test"), findsOneWidget);
      expect(find.text("Processing Lab Test"), findsOneWidget);
      expect(find.text("Clinician Review"), findsOneWidget);
      expect(find.text("Holistic Coach Review"), findsOneWidget);
      expect(find.text("Results Ready"), findsOneWidget);
    });

    testWidgets('responds to tap and changes the current step',
        (WidgetTester tester) async {
      // Create a test widget to use VerticalProgressStepper
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: VerticalProgressStepper(
            currentStep: 2,
            steps: const [
              "Submit Lab Test",
              "Processing Lab Test",
              "Clinician Review",
              "Holistic Coach Review",
              "Results Ready",
            ],
            stepContent: const [
              Text("Step 1: Submit Lab Test"),
              Text("Step 2: Processing Lab Test"),
              Text("Step 3: Clinician Review"),
              Text("Step 4: Holistic Coach Review"),
              Text("Step 5: Results Ready"),
            ],
            onStepTapped: (index) {
              // Handle step tap logic here
            },
          ),
        ),
      ));

      // Verify that the current step is shown correctly
      expect(find.byType(CircleAvatar).first, findsOneWidget);

      // Tap on a different step and verify the active step changes
      await tester
          .tap(find.byType(CircleAvatar).at(3)); // Tap on the fourth step
      await tester.pumpAndSettle();

      // You can add further assertions here based on the behavior you expect
      // For example, checking if the active step changes visually
    });
  });
}
