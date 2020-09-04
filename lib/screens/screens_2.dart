import 'package:flutter/material.dart';
import 'package:ricoht_theta_sc2_flutter_test/displayImage.dart';
import 'package:ricoht_theta_sc2_flutter_test/main.dart';
import 'package:ricoht_theta_sc2_flutter_test/displayImage.dart';
import 'package:ricoht_theta_sc2_flutter_test/last_file_url.dart';
import 'package:ricoht_theta_sc2_flutter_test/toggle_hdr.dart';


class ScreenTwo extends StatefulWidget {
  ScreenTwo({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ScreenTwoState createState() => _ScreenTwoState();
}


class _ScreenTwoState extends State<ScreenTwo> {

  var imageUrl = 'https://picsum.photos/200/300';

  void getImage() async {
    var changedUrl = await displayFile();
    setState(() {
      imageUrl = changedUrl;
    });
    print("change Image");
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
                height: 200, child: Image.network(imageUrl)),
//            Padding(
//              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
//              child: Image.network(imageUrl),
//            ),
            RaisedButton(
              onPressed: () {
                getImage();
              },
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