import 'package:flutter/material.dart';
import 'package:ricoht_theta_sc2_flutter_test/main.dart';
import 'package:ricoht_theta_sc2_flutter_test/takePicture.dart';
import 'package:ricoht_theta_sc2_flutter_test/state.dart';
import 'package:ricoht_theta_sc2_flutter_test/last_file_url.dart';
import 'package:ricoht_theta_sc2_flutter_test/toggle_hdr.dart';


class ScreenTwo extends StatefulWidget {
  ScreenTwo({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ScreenTwoState createState() => _ScreenTwoState();
}


class _ScreenTwoState extends State<ScreenTwo> {
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
//            Container(
//                height: 200, child: Image.network(imageUrl)),
            RaisedButton(
              onPressed: _getImage,
              child: Text('Get SC2 Image'),
            ),
            RaisedButton(
              onPressed: () {
                filterToggle().then((val) => setState(() {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => HomePage(
                        hdrStatus: val
                    ),
                  ), );
                }));

              },
              child: Text('Toggle HDR'),
            ),
          ],
        ),
      ),
    );
  }
}