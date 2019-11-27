import '../Model/sizeInfo.dart';
import 'package:flutter/material.dart';

class StartView extends StatefulWidget {
  @override
  _StartViewState createState() => _StartViewState();
}

class _StartViewState extends State<StartView> with SingleTickerProviderStateMixin {
  int _counter = 0;
  String _image = "assets/images/heart.png";
  bool _random = false;
  var user = ["user1","user2","user3"];
  Widget Grid = Container();

  Animation<double> animation;
  AnimationController controller;
  final tween = Tween(begin: 200.0, end: 250.0);

  initState() {
    super.initState();
    createGrid();
    controller = AnimationController(
        duration: const Duration(milliseconds: 100),
        vsync: this
    );

    animation = tween.animate(controller)
      ..addListener(() {
        setState(() {});
      });
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
            ),
            Grid
          ],
        ),
      ),
    );
  }

  void countUp() {
    setState(() {
      _counter++;
      _random = !_random;
      _image = _random ? "assets/images/heart.png" : "assets/images/angry.png";
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
      Grid = gridWidget;
    });
  }

  Future <List<Widget>> createUserContainer() async {
    var items = <Widget>[];
    for (var i = 0; i < user.length; i++){
      print(sizeInfo.blockSize);
      var item =
      Container(
        width: sizeInfo.blockSize,
        height: sizeInfo.blockSize,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black54),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Center(
                child: Text(user[i]),
              ),
              Center(
                child: Container(
                  width: sizeInfo.blockSize/2,
                  height: sizeInfo.blockSize/2,
                  child: Center(
                      child: Text(_counter.toString()),
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