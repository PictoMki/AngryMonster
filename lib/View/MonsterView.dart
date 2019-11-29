/// Modelのimport
import '../Model/sizeInfo.dart';
import '../Model/AppInfo.dart';
import '../Model/Monster.dart';
import '../Model/AdmobInfo.dart';
/// Logicのimport
import '../Logic/Random.dart';
/// Packageのimport
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_admob/firebase_admob.dart';


class MonsterView extends StatefulWidget {
  @override
  _MonsterViewState createState() => _MonsterViewState();
}

class _MonsterViewState extends State<MonsterView> with SingleTickerProviderStateMixin {

  int _nowUser;
  int _counter;
  bool judge;

  int nowCounter;

  String _image = "assets/images/state/heart.png";
  String _iconImage = Monster.image + "/normal.png";
  bool iconState = false;
  static var _userCounter;
  static var _userColor;
  Widget grid;
  static const red = Colors.red;
  static const grey = Colors.black54;


  Animation<double> animation;
  AnimationController controller;
  final tween = Tween(begin: 250.0, end: 300.0);

  initState() {
    super.initState();
    FirebaseAdMob.instance.initialize(appId: AdmobInfo.interstitialId);
    AdmobInfo.interstitialAd = myInterstitial()..load();

    AdmobInfo.interstitialAd
      ..load()
      ..show();

    _nowUser = 0;
    _counter = 0;
    grid = Container();
    _userCounter = [0,0,0,0,0,0,0,0,0];
    _userColor = [red,grey,grey,grey,grey,grey,grey,grey,grey];


    controller = AnimationController(
        duration: const Duration(milliseconds: 100),
        vsync: this
    );
    animation = tween.animate(controller)
      ..addListener(() {
        setState(() {});
      });
    createGrid();
  }

  shrinkAnimation() {
    controller.reverse();
    Future.delayed(Duration(milliseconds: 100)).then( (_) => controller.forward());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppInfo.title),
        leading: FlatButton(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: 350.0,
              height: 300,
              child: GestureDetector(
                  onTap: () {
                    countUp();
                    shrinkAnimation();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: animation.value,
                        width: animation.value,
                        child: Image.asset(_iconImage),
                      ),
                      SizedBox(
                        height: animation.value,
                        width: 50,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Image.asset(_image),
                          ),
                        ),
                      ),
                    ],
                  )
              ),
            ),
            FlatButton(
              child: Text("STOP"),
              onPressed: (){
                if (countCheck()) {
                  errorDialog(context);
                }else{
                  stopDialog(context);
                }
              }
            ),
            grid
          ],
        ),
      ),
    );
  }

  void endDialog(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: Text("Angry!!!"),
          content: Text("Monsterが怒ってしまいました。"),
          actions: <Widget>[
            FlatButton(
              child: Text(
                  "終了",
                  style: TextStyle(
                      color: Colors.black54
                  )
              ),
              onPressed: (){
                Navigator.pushReplacementNamed(context, '/new');
              } ,
            ),
          ],
        );
      },
    );
  }

  void errorDialog(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: Text("No　Tap　No　Life!"),
          content: Text("一回以上必ずタップしてください。"),
          actions: <Widget>[
            // ボタン領域
            FlatButton(
              child: Text(
                  "わかった？？？",
                  style: TextStyle(
                      color: Colors.black54
                  )
              ),
              onPressed: (){
                Navigator.pop(context);
              } ,
            ),
          ],
        );
      },
    );
  }

  void stopDialog(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: Text("タップ完了"),
          content: Text("次の方に移動します。"),
          actions: <Widget>[
            // ボタン領域
            FlatButton(
              child: Text(
                  "Cancel",
                  style: TextStyle(
                      color: Colors.black54
                  )
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text(
                  "OK",
                  style: TextStyle(
                      color: Colors.black54
                  )
              ),
              onPressed: (){
                setUser();
                Navigator.pop(context);
              } ,
            ),
          ],
        );
      },
    );
  }

  void setUser() {
    setState(() {
      _userColor[_nowUser] = Colors.black54;
      if (_nowUser == AppInfo.user.length - 1) {
        _nowUser = 0;
      }else{
        _nowUser++;
      }
      _userColor[_nowUser] = Colors.red;
      _counter = _userCounter[_nowUser];
      nowCounter = _counter;
      createGrid();
    });
  }

  void countUp() {
    _counter++;
    AppInfo.allCount++;
    saveData(AppInfo.allCount);
    if (RandomLogic().randomBool(_counter)) {
      endDialog(context);
    }
    else{
      setState(() {
        _userCounter[_nowUser] = _counter;
        iconState = !iconState;
        _image = iconState ? "assets/images/state/heart.png" : "assets/images/state/angry.png";
        _iconImage = iconState ? Monster.image + "/heart.png" : Monster.image + "/angry.png";
        createGrid();
      });
    }
  }

  void createGrid() async {
    var list = await createUserContainer();
    var gridWidget;
    if (list[0].length < 3) {
      gridWidget = Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: list[0]
      );
    }
    else{
      if (list[1].length < 3) {
        gridWidget = Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: list[0]
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: list[1]
            ),
          ],
        );
      }
      else{
        gridWidget = Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: list[0]
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: list[1]
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: list[2]
            ),
          ],
        );
      }
    }
    setState(() {
      grid = gridWidget;
    });
  }

  Future <List<List<Widget>>> createUserContainer() async {
    var items1 = <Widget>[];
    var items2 = <Widget>[];
    var items3 = <Widget>[];
    var items = [items1,items2,items3];

    for (var i = 0; i < AppInfo.user.length; i++){
      var item =
      Container(
        width: SizeInfo.blockWidth,
        height: SizeInfo.blockHeight,
          decoration: BoxDecoration(
            border: Border.all(color: _userColor[i]),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Center(
                child: Text(AppInfo.user[i]),
              ),
              Center(
                child: Container(
                  width: SizeInfo.blockWidth/2,
                  height: SizeInfo.blockHeight/2,
                  child: Center(
                      child: Text(_userCounter[i].toString()),
                  ),
                ),
              )

            ],
          )
      );
      if (i < 3) {
        items1.add(item);
      }else if (3 <= i  && i < 6) {
        items2.add(item);
      }else{
        items3.add(item);
      }

    }
    return items;
  }

  saveData(int allCount) async {

    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setInt("allCount", allCount);
  }

  bool countCheck() {
    if (nowCounter == _counter) {
      return true;
    }else{
      return false;
    }
  }

  InterstitialAd myInterstitial() {
    return InterstitialAd(
      adUnitId: AdmobInfo.interstitialId,
      targetingInfo: AdmobInfo.targetingInfo,
      listener: (MobileAdEvent event) {
        if (event == MobileAdEvent.failedToLoad) {
          AdmobInfo.interstitialAd..load();
        } else if (event == MobileAdEvent.closed) {
          AdmobInfo.interstitialAd = myInterstitial()..load();
        }
      },
    );
  }

}