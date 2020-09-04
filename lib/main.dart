import 'package:flutter/material.dart';
import 'package:ricoht_theta_sc2_flutter_test/screens/screens_2.dart';
import 'package:ricoht_theta_sc2_flutter_test/takePicture.dart';
import 'package:ricoht_theta_sc2_flutter_test/state.dart';
import 'package:ricoht_theta_sc2_flutter_test/last_file_url.dart';
import 'package:panorama/panorama.dart';
import 'toggle_hdr.dart';
import 'dart:async';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toggle HDR Test',
      theme: ThemeData(),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      home: HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {
  String hdrStatus;
  HomePage({this.hdrStatus = ''});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test of Toggling HDR'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(hdrStatus),
            RaisedButton(
              onPressed: takePicture,
              child: Text('Take Picture'),
            ),
            RaisedButton(
              onPressed: state,
              child: Text('Camera State'),
            ),
            RaisedButton(
              child: Text('Next Screen'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ScreenTwo(title: 'Toggle HDR',)
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}


