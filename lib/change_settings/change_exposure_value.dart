import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../pretty_print.dart';
import '../get_setting.dart';
import '../info.dart';

Future<String> changeExposureValue ({selectedExposureValue}) async {
  var url ='http://192.168.1.1/osc/commands/execute';
  double exposureCompensation = selectedExposureValue;

//  Actually sets the hdr filter on or off
  Map data = {
    'name': 'camera.setOptions',
    'parameters': {
      'options': {
        "exposureCompensation": exposureCompensation,
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
  print('Exposure value is $exposureCompensation');
  return 'Exposure value is: $exposureCompensation';
}
