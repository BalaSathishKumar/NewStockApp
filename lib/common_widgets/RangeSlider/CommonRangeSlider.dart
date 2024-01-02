import 'package:base_flutter_provider_project/constants/colors.dart';
import 'package:flutter/material.dart';


class CommonRangeSlider extends StatelessWidget {
  CommonRangeSlider({
    required this.currentRangeValues,
    required this.onPressed,
  });

  //_currentRangeValues = currentRangeValues;

  final RangeValues currentRangeValues;
  final Function(RangeValues) onPressed;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        thumbColor: Appcolors.txtpurple,
        thumbShape: CustomSliderThumbCircle(
          thumbRadius: 12.0,
          borderThickness: 2.0,
          borderColor: Colors.black,
          thumbColor: Colors.blue,
        ),
        trackHeight: 4.0,
      ),
      child: RangeSlider(
        values: currentRangeValues,
        //min: 10000,
        max: 30000000,
        divisions: 10000,
        activeColor: Appcolors.txtlitegreen2, // Change active (filled) track color here
        inactiveColor: Appcolors.txtlitegreen2, // Change inactive (unfilled) track color here
      //  thumbColor: Colors.red, // Change the slider thumbs' color here
        labels: RangeLabels(
          currentRangeValues.start.round().toString(),
          currentRangeValues.end.round().toString(),
        ),
        onChanged: (RangeValues values) {
          onPressed(values);
        },

      ),
    );
  }
}

class CustomSliderThumbCircle extends SliderComponentShape {
  final double thumbRadius;
  final double borderThickness;
  final Color borderColor;
  final Color thumbColor;

  CustomSliderThumbCircle({
    required this.thumbRadius,
    required this.borderThickness,
    required this.borderColor,
    required this.thumbColor,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(PaintingContext context, Offset center,
      { Animation<double>? activationAnimation,
         Animation<double>? enableAnimation,
         bool? isDiscrete,
         TextPainter? labelPainter,
         RenderBox? parentBox,
         SliderThemeData? sliderTheme,
        TextDirection? textDirection,
        double? value,
        double? textScaleFactor,
        Size? sizeWithOverflow}) {
    final Canvas canvas = context.canvas;

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderThickness;

    final fillPaint = Paint()
      ..color = thumbColor
      ..style = PaintingStyle.fill;

    Paint activePaint;
    //if (isEnabled) {
      activePaint = fillPaint;
   // } else {
      activePaint = borderPaint;
   // }

    canvas.drawCircle(center, thumbRadius, borderPaint);
    canvas.drawCircle(center, thumbRadius - borderThickness, activePaint);
  }
}