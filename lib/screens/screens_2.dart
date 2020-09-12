import 'package:flutter/material.dart';
import 'package:ricoht_theta_sc2_flutter_test/change_settings/change_captureInterval.dart';
import 'package:ricoht_theta_sc2_flutter_test/change_settings/change_color_temperature.dart';
import 'package:ricoht_theta_sc2_flutter_test/components/reusableSlider.dart';
import 'dart:math';
import 'package:ricoht_theta_sc2_flutter_test/displayImage.dart';
import 'package:ricoht_theta_sc2_flutter_test/get_setting.dart';
import 'package:ricoht_theta_sc2_flutter_test/main.dart';
import 'package:ricoht_theta_sc2_flutter_test/displayImage.dart';
import 'package:ricoht_theta_sc2_flutter_test/last_file_url.dart';
import 'package:ricoht_theta_sc2_flutter_test/change_settings/toggle_hdr.dart';


class ScreenTwo extends StatefulWidget {
  ScreenTwo({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ScreenTwoState createState() => _ScreenTwoState();
}


class _ScreenTwoState extends State<ScreenTwo> {

  var imageUrl = 'https://picsum.photos/200/300';
  double captureInterval = 50;
  double colorTemperature = 5000;
  double exposureCompensation = 0.0;
  String hdrState = 'Loading...';

  void getValues() {
    getSetting(selectedCommand: 'captureInterval').then((val) => setState(() {
      captureInterval = val.toDouble();
    }));
    getSetting(selectedCommand: '_colorTemperature').then((val) => setState(() {
      colorTemperature = val.toDouble();
    }));
    getSetting(selectedCommand: 'exposureCompensation').then((val) => setState(() {
      exposureCompensation = val.toDouble();
    }));
    getSetting(selectedCommand: '_filter').then((val) => setState(() {
      hdrState = val;
    }));
  }

  @override
  void initState() {
    getValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'RICOH THETA SC2',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Setting: $hdrState'),
                RaisedButton(
                  onPressed: () {
                    filterToggle().then((val) => setState(() {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => HomePage(
                            outputText: val,
                        ),
                      ), );
                    }));

                  },
                  child: Text('Toggle HDR'),
                ),
              ],
            ),
            Row(
              children: [
                ReusableSlider(sliderValue: captureInterval,
                    minValue: 0,
                    maxValue: 100,
                    divisions: 100,
                    onChanged: (double newValue) {
                      setState(() {
                        captureInterval = newValue;
                      });
                    },
                ),
                RaisedButton(
                  child: Text('Change capture interval'),
                  onPressed: () {
                    changeCaptureInterval(selectedCaptureInterval: captureInterval.toInt()).then((val) => setState(() {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => HomePage(
                          outputText: val.toString(),
                        ),
                      ), );
                    }));
                    },
                ),
              ],
            ),
            Row(
              children: [
                ReusableSlider(sliderValue: colorTemperature,
                  minValue: 2500,
                  maxValue: 10000,
                  divisions: 75,
                  onChanged: (double newValue) {
                    setState(() {
                      colorTemperature = newValue;
                    });
                  },
                ),
                RaisedButton(
                  child: Text('Change color temperature'),
                  onPressed: () {
                    changeColorTemperature(selectedColorTemp: colorTemperature.toInt()).then((val) => setState(() {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => HomePage(
                          outputText: val.toString(),
                        ),
                      ), );
                    }));
                  },
                ),
              ],
            ),
            Row(
              children: [
                ReusableSlider(sliderValue: (exposureCompensation * 10).round().toDouble() / 10,
                  minValue: -0.9,
                  maxValue: 0.9,
                  divisions: 13,
                  onChanged: (double newValue) {
                    setState(() {
                      exposureCompensation = (newValue * 10).round().toDouble() / 10;
                    });
                  },
                ),
                RaisedButton(
                  child: Text('Change exposure value'),
                  onPressed: () {
                    changeColorTemperature(selectedColorTemp: colorTemperature.toInt()).then((val) => setState(() {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => HomePage(
                          outputText: val.toString(),
                        ),
                      ), );
                    }));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}