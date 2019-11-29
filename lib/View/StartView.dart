import '../Model/sizeInfo.dart';
import '../Model/AppInfo.dart';
import 'package:flutter/material.dart';
import '../Logic/Random.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartView extends StatefulWidget {
  @override
  _StartViewState createState() => _StartViewState();
}

class _StartViewState extends State<StartView> with SingleTickerProviderStateMixin {
  int _nowUser;
  int _counter;
  bool judge;

  String _image = "assets/images/state/heart.png";
  bool iconState = false;
  static var _userCounter;
  static var _userColor;
  Widget grid;
  static const red = Colors.red;
  static const grey = Colors.black54;


  Animation<double> animation;
  AnimationController controller;
  final tween = Tween(begin: 200.0, end: 250.0);

  initState() {
    super.initState();
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
        title: Text("AngryMonster"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: 300,
              height: 250,
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
                        child: Image.asset('assets/images/monster/normal/icon.png'),
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
                stopDialog(context);
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
                Navigator.pushReplacementNamed(context, '/');
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
        createGrid();
      });
    }
  }

  void createGrid() async {
    var list = await createUserContainer();
    print(list[0].length);
    print(list[1].length);
    print(list[2].length);
    var gridWidget;
    if (list[0].length <= 3) {
      print(1);
      gridWidget = Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: list[0]
      );
    }
    else{
      if (list[1].length <= 3) {
        print(2);
        gridWidget = Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: list[0]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: list[1]
            ),
          ],
        );
      }
      else{
        print(3);
        gridWidget = Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: list[0]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: list[1]
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
        width: sizeInfo.blockSize,
        height: sizeInfo.blockSize,
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
                  width: sizeInfo.blockSize/2,
                  height: sizeInfo.blockSize/2,
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

}