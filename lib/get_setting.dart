import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'pretty_print.dart';

Future<String> getSetting({selectedCommand}) async {
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
  String hdrState = hdrType['results']['options']['_filter'];

  return hdrState;
}

Future<String> displayAllSettings() async {
  var url = 'http://192.168.1.1/osc/commands/execute';

  Map data = {
    'name': 'camera.getOptions',
    'parameters': {
      'optionNames': [
        '_autoBracket',
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
        '_function',
        '_gain',
        'gpsInfo',
        'iso',
        '_bitrate',
        '_filter',
      ]
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
  print(allSettings);

  return allSettings;
}