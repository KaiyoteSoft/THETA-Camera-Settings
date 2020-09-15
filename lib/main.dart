import 'package:flutter/material.dart';
import 'package:ricoht_theta_sc2_flutter_test/screens/screens_2.dart';
import 'package:ricoht_theta_sc2_flutter_test/takePicture.dart';
import 'package:ricoht_theta_sc2_flutter_test/state.dart';
import 'package:ricoht_theta_sc2_flutter_test/last_file_url.dart';
import 'package:ricoht_theta_sc2_flutter_test/get_setting.dart';
import 'package:panorama/panorama.dart';
import 'change_settings/toggle_hdr.dart';
import 'dart:async';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String initialText = 'Attempting to load camera info...';

  void displayText() {
    displayAllSettings().then((val) => setState(() {
      initialText = val;
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
      home: HomePage(outputText: initialText),
    );
  }
}


class HomePage extends StatefulWidget {
  String outputText;
  HomePage({this.outputText});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var imageUrl = 'https://picsum.photos/200/300';

  void getImage() async {
    var changedUrl = await displayFile();
    setState(() {
      imageUrl = changedUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Camera Settings'),
      ),
      body: Center(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () {
                    displayAllSettings().then((val) => setState(() {
                      widget.outputText = val;
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
                Container(
                  child: Image.network(imageUrl),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(
                        child: Text('Take Picture'),
                        onPressed: () {
                          takePicture();
                        }
                    ),
                    RaisedButton(
                      child: Text('Display last picture'),
                      onPressed: () {
                        setState(() {
                          getImage();
                        });
                      },
                    ),
                  ],
                ),
                Text(widget.outputText, style: TextStyle(
                  fontSize: 15,
                ),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


