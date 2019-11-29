import 'package:AngryMonster/Model/AdmobInfo.dart';
import 'package:flutter/material.dart';
import '../Model/sizeInfo.dart';
import 'package:firebase_admob/firebase_admob.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    super.initState();

    ///Admobの導入
    // インスタンスを初期化（自分のアプリIDを挿入：今回はテスト用のアプリIDを利用）
    FirebaseAdMob.instance.initialize(appId: AdmobInfo.bannerId);

    // バナー広告を表示する
    myBanner
      ..load()
      ..show(
        // ボトムからのオフセットで表示位置を決定
        anchorOffset: 0.0,
        anchorType: AnchorType.bottom,
      );

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



  BannerAd myBanner = BannerAd(
    // 広告ユニットID（テスト用のIDを使用、本番は自分の広告ユニットIDを利用）
    adUnitId: AdmobInfo.bannerId,
    size: AdSize.smartBanner,
    targetingInfo: AdmobInfo.targetingInfo,
    listener: (MobileAdEvent event) {
      // 広告の読み込みが完了
      print("BannerAd event is $event");
    },
  );
}