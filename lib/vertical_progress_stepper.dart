import 'package:flutter/material.dart';

/// A customizable vertical progress stepper widget for Flutter.
///
/// This widget displays a series of steps with customizable content and a
/// progress indicator. It supports dynamic step navigation, color customization,
/// and animation duration control.
class VerticalProgressStepper extends StatelessWidget {
  /// The current active step index.
  ///
  /// This is the index of the step that is currently active.
  final int currentStep;

  /// The list of step titles to be displayed.
  ///
  /// Each string in this list represents the title of a step.
  final List<String> steps;

  /// The content for each step.
  ///
  /// A list of widgets, each representing the content of the corresponding step.
  final List<Widget> stepContent;

  /// The color of the active step's circle and text.
  ///
  /// This color is applied to the step circle and text for active steps.
  final Color activeColor;

  /// The color of the inactive step's circle and text.
  ///
  /// This color is applied to the step circle and text for inactive steps.
  final Color inactiveColor;

  /// The spacing between steps.
  ///
  /// This defines the vertical space between each step in the stepper.
  final double spacing;

  /// Callback function when a step is tapped.
  ///
  /// This function is called when a user taps on a step, passing the index of the
  /// tapped step as an argument. It allows for dynamic step navigation.
  final ValueChanged<int>? onStepTapped;

  /// Optional animation duration for step transitions.
  ///
  /// This controls the duration of the animation for step transitions.
  /// If not provided, the default duration is used.
  final Duration? animationDuration;

  /// Creates a [VerticalProgressStepper] widget.
  ///
  /// The [currentStep] parameter determines the active step, and the [steps]
  /// and [stepContent] lists define the step titles and corresponding content.
  /// [activeColor] and [inactiveColor] control the color of the steps, while
  /// [spacing] defines the space between each step. [onStepTapped] allows dynamic
  /// step navigation, and [animationDuration] controls step transition animations.
  const VerticalProgressStepper({
    super.key,
    required this.currentStep,
    required this.steps,
    required this.stepContent,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.spacing = 16.0,
    this.onStepTapped,
    this.animationDuration,
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

  /// Builds the step circle for the given [stepIndex].
  ///
  /// This method returns a circle widget that visually represents the completion
  /// status of a step. It is filled with [activeColor] if the step is completed,
  /// or [inactiveColor] if the step is pending.
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

  /// Builds the text for the step at the given [stepIndex].
  ///
  /// This method returns a [Text] widget displaying the title of the step. The
  /// text color is determined by whether the step is active or inactive.
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

  /// Builds the line connecting steps at the given [stepIndex].
  ///
  /// This method returns an animated vertical line that connects each step.
  /// The line's height is determined based on the completion status of the step.
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
