import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'pretty_print.dart';
import 'dart:convert';

Future<String> info() async {
  var url = 'http://192.168.1.1/osc/info';
  var response = await http.get(url);

  Map<String, dynamic> cameraInfo = jsonDecode(response.body);
  var cameraModel = cameraInfo['model'];

//  print(cameraModel);
//  prettyPrint(response.body);
  return (cameraModel);
}
