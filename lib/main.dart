import 'package:flutter/material.dart';
import 'package:ricoht_theta_sc2_flutter_test/screens/screens_2.dart';
import 'package:ricoht_theta_sc2_flutter_test/takePicture.dart';
import 'package:ricoht_theta_sc2_flutter_test/state.dart';
import 'package:ricoht_theta_sc2_flutter_test/last_file_url.dart';
import 'package:ricoht_theta_sc2_flutter_test/get_setting.dart';
import 'package:panorama/panorama.dart';
import 'toggle_hdr.dart';
import 'dart:async';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String hdrText = 'Loading hdr state...';

  void displayText() {
    displayAllSettings().then((val) => setState(() {
      hdrText = val;
    }));
  }

  @override
  void initState() {
    displayText();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List Camera Settings',
      theme: ThemeData(),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      home: HomePage(hdrStatus: hdrText),
    );
  }
}


class HomePage extends StatefulWidget {
  String hdrStatus;
  HomePage({this.hdrStatus});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

//  @override
//  void initState() {
//    displayText();
//    super.initState();
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Camera Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.hdrStatus),
//            RaisedButton(
//              onPressed: takePicture,
//              child: Text('Take Picture'),
//            ),
            RaisedButton(
              onPressed: () {
                displayAllSettings().then((val) => setState(() {
                  widget.hdrStatus = val;
                }));
              },
              child: Text('Re-display all camera settings'),
            ),
            RaisedButton(
              child: Text('Next Screen (Adjust Settings)'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ScreenTwo(title: 'Change Camera Settings',)
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}


