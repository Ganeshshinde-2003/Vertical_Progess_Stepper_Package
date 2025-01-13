import 'package:flutter/material.dart';

class VerticalProgressStepper extends StatelessWidget {
  final int currentStep;
  final List<String> steps;
  final List<Widget> stepContent;
  final Color activeColor;
  final Color inactiveColor;
  final double spacing;
  final ValueChanged<int>? onStepTapped;
  final Duration? animationDuration; // Optional animation duration

  const VerticalProgressStepper({
    super.key,
    required this.currentStep,
    required this.steps,
    required this.stepContent,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.spacing = 16.0,
    this.onStepTapped,
    this.animationDuration, // Make it optional for better control
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < steps.length; i++) ...[
          GestureDetector(
            onTap: () => onStepTapped?.call(i),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    // Circle for the step
                    _buildStepCircle(i),
                    if (i < steps.length - 1) const SizedBox(height: 10),
                    // Animated vertical line
                    if (i < steps.length - 1) _buildStepLine(i),
                  ],
                ),
                const SizedBox(width: 16),
                // Text content for each step
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildStepText(i),
                      const SizedBox(height: 4),
                      stepContent[i],
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (i < steps.length - 1) SizedBox(height: spacing),
        ],
      ],
    );
  }

  Widget _buildStepCircle(int stepIndex) {
    return CircleAvatar(
      radius: 12,
      backgroundColor: stepIndex <= currentStep ? activeColor : inactiveColor,
      child: Icon(
        stepIndex < currentStep ? Icons.check : Icons.circle,
        color: Colors.white,
        size: 16,
      ),
    );
  }

  Widget _buildStepText(int stepIndex) {
    return Text(
      steps[stepIndex],
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: stepIndex <= currentStep ? activeColor : inactiveColor,
      ),
    );
  }

  Widget _buildStepLine(int stepIndex) {
    const double lineHeight = 60.0;
    final double progress = stepIndex < currentStep
        ? 1.0
        : stepIndex == currentStep
            ? 1.0 // Full line for completed steps
            : 0.0;

    return SizedBox(
      width: 2,
      height: lineHeight,
      child: Stack(
        children: [
          // Inactive bar (background)
          Container(
            width: 2,
            height: lineHeight,
            color: inactiveColor.withOpacity(0.3),
          ),
          // Active bar (fills based on animation)
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 2,
              height: lineHeight * progress,
              color: activeColor,
            ),
          ),
        ],
      ),
    );
  }
}
