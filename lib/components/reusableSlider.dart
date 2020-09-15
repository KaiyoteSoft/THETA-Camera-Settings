import 'package:flutter/material.dart';

class ReusableSlider extends StatelessWidget{
  double sliderValue;
  Function onChanged;
  double minValue;
  double maxValue;
  int divisions;
  String label;

  ReusableSlider({@required this.sliderValue, @required this.minValue, @required this.maxValue, this.divisions, this.onChanged, this.label});

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: sliderValue,
      min: minValue,
      max: maxValue,
      divisions: this.divisions,
      label: label + sliderValue.toString(),
      onChanged: onChanged,
    );
  }
}
