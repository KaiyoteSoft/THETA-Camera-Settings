import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

Future<String> displayFile() async {
//  var url = 'http://192.168.1.1/osc/state';
  var url = 'http://192.168.1.1/osc/commands/execute';

  Map executeCommand = {'name': 'camera.listFiles',
    'parameters': {
      'fileType': 'image',
      'entryCount': 2,
      'maxThumbSize': 0
    }
  };

  var commandJson = jsonEncode(executeCommand);

  var response = await http.post(url,
      headers: {'Content-Type': 'application/json; charset=utf-8'}, body: commandJson);

  Map<String, dynamic> listFilesOutput = jsonDecode(response.body);

  var latestFileUrl = listFilesOutput['results']['entries'][0]['fileUrl'];


  return latestFileUrl;
//   print(latestFileUrl);
}
