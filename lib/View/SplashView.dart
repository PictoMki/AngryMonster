import 'package:flutter/material.dart';
import '../Model/sizeInfo.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeInfo.displayWidth = MediaQuery
        .of(context)
        .size
        .width;
    SizeInfo.displayHeight = MediaQuery
        .of(context)
        .size
        .height;
    SizeInfo.blockPadding = 10;
    SizeInfo.blockWidth = SizeInfo.displayWidth / 3 - SizeInfo.blockPadding * 3;
    SizeInfo.blockHeight =
        SizeInfo.displayHeight / 9 - SizeInfo.blockPadding * 3;
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("本アプリは複数人で遊ぶようです。"),
              Text("一人でも遊べますが、悲しくなるので、、、、、"),
              FlatButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/new');
                },
                child: Text("Start"),
              )
            ],
          ),
        )
    );
  }
}