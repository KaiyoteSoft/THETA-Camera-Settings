import 'dart:async';
import 'dart:convert';
//import 'dart:html';
import 'package:http/http.dart' as http;
import 'pretty_print.dart';
import 'info.dart';

Future<dynamic> getSetting({selectedCommand}) async {
  String command = selectedCommand;

  var url = 'http://192.168.1.1/osc/commands/execute';

  Map data = {
    'name': 'camera.getOptions',
    'parameters': {
      'optionNames': [
        command,
      ]
    }
  };

  //encode Map to JSON
  var body = jsonEncode(data);

  var response = await http.post(url,
      headers: {"Content-Type": "application/json;charset=utf-8"}, body: body);
  Map<String, dynamic> hdrType = jsonDecode(response.body);
  var hdrState = hdrType['results']['options'][command];

  return hdrState;
}

Future<String> displayAllSettings() async {
  String cameraModel = await info();

  var url = 'http://192.168.1.1/osc/commands/execute';
  List optionNames = [
    '_autoBracket',
    '_bitrate',
    '_bluetoothPower',
    'captureInterval',
    'captureMode',
    'captureNumber',
    'clientVersion',
    '_colorTemperature',
    'dateTimeZone',
    'exposureCompensation',
    'exposureDelay',
    'exposureProgram',
    'fileFormat',
    '_filter',
    '_gain',
    'gpsInfo',
    'iso',
    'isoAutoHighLimit',
    '_latestEnabledExposureDelayTime',
    '_maxRecordableTime',
    'offDelay',
    'previewFormat',
    'remainingPictures',
    'remainingSpace',
    'remainingVideoSeconds',
    'shutterSpeed',
    '_shutterVolume',
    'sleepDelay',
    'totalSpace',
    'whiteBalance',
  ];

  if (cameraModel == 'RICOH THETA V') {
    optionNames.addAll(['aperture',
  '_authentication',
    '_language',
    '_microphone',
      '_microphoneChannel',
      '_networkType',
      '_shootingMethod',
      '_timeShift',
      '_topBottomCorrection',
      'videoStitching',
      '_wlanFrequency',
      '_imageStitching',
    ]);
  }
  else if (cameraModel == 'RICOH THETA SC2') {
    optionNames.addAll(['_function',
      '_wlanChannel',

    ]);
  }



  Map data = {
    'name': 'camera.getOptions',
    'parameters': {
      'optionNames': optionNames
    }
  };

  //encode Map to JSON
  var body = jsonEncode(data);

  var response = await http.post(url,
      headers: {"Content-Type": "application/json;charset=utf-8"}, body: body);
  Map<String, dynamic> hdrType = jsonDecode(response.body);
  String allSettings = jsonEncode(hdrType['results']['options']);
  String hdrState = outputPrettyPrint(response.body);
  allSettings = outputPrettyPrint(allSettings);
  prettyPrint(allSettings);

  return allSettings;
}