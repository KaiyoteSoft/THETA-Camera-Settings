import 'package:http/http.dart' as http;

void state() async {
  String url = 'http://192.168.1.1/osc/state';

  var response = await http.post(url);
  print(response.body);
}
