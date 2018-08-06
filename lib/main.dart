import 'package:flutter/material.dart';
import 'package:flutter_ml_ki_sample/DetailWidget.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("文字読み取り"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _startCamera(),
          ],
        ),
      ),
    );
  }

  Widget _startCamera() {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  splashColor: Colors.blueGrey,
                  onPressed: () {
                    _onPickImageSelected();
                  },
                  child: Text("start camera"),
                )),
          ),
        ],
      ),
    );
  }

  void _onPickImageSelected() async {
    var imageSource = ImageSource.camera;

    try {
      final file = await ImagePicker.pickImage(source: imageSource);
      if (file == null) {
        throw Exception('ファイルを取得できませんでした');
      }

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DetailWidget(file)));
    } catch (e) {
    }
  }
}
