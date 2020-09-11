/// disable exposure delay
///
/// https://api.ricoh/docs/theta-web-api-v2.1/commands/camera.set_options/
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../pretty_print.dart';
import '../get_setting.dart';
import '../info.dart';

Future<String> filterToggle () async {
  var url ='http://192.168.1.1/osc/commands/execute';

  String hdrState = await getSetting(selectedCommand: '_filter');


//  Depending on hdr state, toggle between the two modes
  if (hdrState == 'off') {
    hdrState = 'hdr';
  }
  else {
    hdrState = 'off';
  }

//  Actually sets the hdr filter on or off
  Map data = {
    'name': 'camera.setOptions',
    'parameters': {
      'options': {
        "_filter": hdrState,
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
  print(hdrState);

//  Map<String, dynamic> hdrType = jsonDecode(response.body);
//  String hdrState = hdrType['results']['options']['_filter'];

  return 'HDR status: $hdrState';
}
