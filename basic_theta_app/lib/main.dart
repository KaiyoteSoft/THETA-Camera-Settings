import 'package:flutter/material.dart';
import 'package:ricoht_theta_sc2_flutter_test/takePicture.dart';
import 'package:ricoht_theta_sc2_flutter_test/state.dart';
import 'package:ricoht_theta_sc2_flutter_test/last_file_url.dart';
import 'package:panorama/panorama.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RICOH THETA SC2 Demo',
      theme: ThemeData(),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      home: MyHomePage(title: 'SC2 Flutter Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // var imageUrl = 'https://picsum.photos/400/200';

  var imageUrl =
      'http://192.168.1.1/files/thetasc26c21a247d9055838792badc5/100RICOH/R0010124.JPG';

  void _getImage() async {
    var last_file = await lastFileUrl();

    setState(() {
      print(last_file);
      imageUrl = last_file;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'RICOH THETA SC2',
            ),
            Container(
                height: 200, child: Panorama(child: Image.network(imageUrl))),
            RaisedButton(
              onPressed: takePicture,
              child: Text('Take Picture'),
            ),
            RaisedButton(
              onPressed: state,
              child: Text('Camera State'),
            ),
            RaisedButton(
              onPressed: _getImage,
              child: Text('Get SC2 Image'),
            ),
          ],
        ),
      ),
    );
  }
}
