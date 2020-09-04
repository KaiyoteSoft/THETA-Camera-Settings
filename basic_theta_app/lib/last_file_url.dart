import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

Future<String> lastFileUrl() async {
  var url = 'http://192.168.1.1/osc/state';

  var response = await http
      .post(url, headers: {'Content-Type': 'application/json; charset=utf-8'});

  Map<String, dynamic> thetaState = jsonDecode(response.body);

  String imageFileUrl = thetaState['state']['_latestFileUrl'];
  print(imageFileUrl);
  var imageFileName = imageFileUrl.split("/")[6];
  print(imageFileName);
  return imageFileUrl;
}