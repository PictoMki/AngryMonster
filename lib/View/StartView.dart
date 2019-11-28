import '../Model/sizeInfo.dart';
import '../Model/AppInfo.dart';
import 'package:flutter/material.dart';

class StartView extends StatefulWidget {
  @override
  _StartViewState createState() => _StartViewState();
}

class _StartViewState extends State<StartView> with SingleTickerProviderStateMixin {
  int _nowUser;
  int _counter;
  bool judge;

  String _image = "assets/images/heart.png";
  bool iconState = false;
  static var _userCounter;
  static var _userColor;
  Widget grid;

  Animation<double> animation;
  AnimationController controller;
  final tween = Tween(begin: 200.0, end: 250.0);

  initState() {
    super.initState();
    _nowUser = 0;
    _counter = 0;
    grid = Container();
    _userCounter = [0,0,0,0,0,0,0,0,0];
    _userColor = [Colors.red,Colors.black54,Colors.black54,Colors.black54,Colors.black54,Colors.black54,Colors.black54,Colors.black54,Colors.black54];
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
                        child: Image.asset('assets/images/icon.png'),
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
              onPressed: setUser,
            ),
            grid
          ],
        ),
      ),
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
    setState(() {
      _userCounter[_nowUser] = _counter;
      iconState = !iconState;
      _image = iconState ? "assets/images/heart.png" : "assets/images/angry.png";
      createGrid();
    });
  }

  void createGrid() async {
    var list = await createUserContainer();
    var gridWidget = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: list
    );
    setState(() {
      grid = gridWidget;
    });
  }

  Future <List<Widget>> createUserContainer() async {
    var items = <Widget>[];
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
      items.add(item);
    }
    return items;
  }

}