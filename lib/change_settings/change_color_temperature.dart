import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../pretty_print.dart';
import '../get_setting.dart';
import '../info.dart';

Future<String> changeColorTemperature ({selectedColorTemp}) async {
  var url ='http://192.168.1.1/osc/commands/execute';
  int colorTemp = selectedColorTemp;

//  Actually sets the hdr filter on or off
  Map data = {
    'name': 'camera.setOptions',
    'parameters': {
      'options': {
        "whiteBalance": "_colorTemperature",
        "_colorTemperature": colorTemp,
      }
    }
  };

  //encode Map to JSON
  var body = jsonEncode(data);

  var response = await http.post(url,
      headers: {"Content-Type": "application/json;charset=utf-8"},
      body: body
  );
  print("${response.statusCode}");
  prettyPrint("${response.body}");

//  Map<String, dynamic> hdrType = jsonDecode(response.body);
//  String hdrState = hdrType['results']['options']['_filter'];
  print('Color temp is $colorTemp');
  return 'Color temp is: $colorTemp';
}
