/// disable exposure delay
///
/// https://api.ricoh/docs/theta-web-api-v2.1/commands/camera.set_options/
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../pretty_print.dart';
import '../get_setting.dart';
import '../info.dart';

Future<String> changeCaptureInterval ({selectedCaptureInterval}) async {
  var url ='http://192.168.1.1/osc/commands/execute';
  int captureValue = selectedCaptureInterval;

//  Actually sets the hdr filter on or off
  Map data = {
    'name': 'camera.setOptions',
    'parameters': {
      'options': {
        "captureInterval": captureValue,
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
  print('Capture interval is $captureValue');
  return 'Capture interval is: $captureValue';
}
