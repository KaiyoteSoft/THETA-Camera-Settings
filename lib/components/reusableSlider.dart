import 'package:flutter/material.dart';

class ReusableSlider extends StatelessWidget{
  double sliderValue;
  Function onChanged;
  double minValue;
  double maxValue;
  int divisions;

  ReusableSlider({@required this.sliderValue, @required this.minValue, @required this.maxValue, this.divisions, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: sliderValue,
      min: minValue,
      max: maxValue,
      divisions: this.divisions,
      label: 'Capture interval: ' + sliderValue.toString(),
      onChanged: onChanged,
    );
  }
}
