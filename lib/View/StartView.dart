import '../Model/sizeInfo.dart';
import '../Model/AppInfo.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/Monster.dart';

class StartView extends StatefulWidget {
  @override
  _StartViewState createState() => _StartViewState();
}

class _StartViewState extends State<StartView>{

  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  TextEditingController _controller4 = TextEditingController();
  TextEditingController _controller5 = TextEditingController();
  TextEditingController _controller6 = TextEditingController();
  TextEditingController _controller7 = TextEditingController();
  TextEditingController _controller8 = TextEditingController();
  TextEditingController _controller9 = TextEditingController();

  var listView;

  var hizumeMode = false;

  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    getData();
    listView = ListView();

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_focusNode),
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("AngryMonster"),
          leading: FlatButton(),
        ),
        body: Center(
          child: Container(
            width: SizeInfo.displayWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                    "参加するメンバーを入力して！",
                  style: TextStyle(
                    fontSize: 24
                  ),
                ),
                Text(
                  "今までの総タップ数:${AppInfo.allCount}",
                  style: TextStyle(
                      fontSize: 20,
                    color: Colors.black54
                  ),
                ),
                Container(
                  width: SizeInfo.displayWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            width: SizeInfo.blockWidth,
                            height: 60,
                            child: TextField(
                              style: TextStyle(
                                  fontSize: 12
                              ),
                              controller: _controller1,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black)
                                  ),
                                  hintText: "ユーザー名"
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            width: SizeInfo.blockWidth,
                            height: 60,
                            child: TextField(
                              style: TextStyle(
                                  fontSize: 12
                              ),
                              controller: _controller2,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black)
                                  ),
                                  hintText: "ユーザー名"
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            width: SizeInfo.blockWidth,
                            height: 60,
                            child: TextField(
                              style: TextStyle(
                                  fontSize: 12
                              ),
                              controller: _controller3,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black)
                                  ),
                                  hintText: "ユーザー名"
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            width: SizeInfo.blockWidth,
                            height: 60,
                            child: TextField(
                              style: TextStyle(
                                  fontSize: 12
                              ),
                              controller: _controller4,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black)
                                  ),
                                  hintText: "ユーザー名"
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            width: SizeInfo.blockWidth,
                            height: 60,
                            child: TextField(
                              style: TextStyle(
                                  fontSize: 12
                              ),
                              controller: _controller5,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black)
                                  ),
                                  hintText: "ユーザー名"
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            width: SizeInfo.blockWidth,
                            height: 60,
                            child: TextField(
                              style: TextStyle(
                                fontSize: 12
                              ),
                              controller: _controller6,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black)
                                  ),
                                  hintText: "ユーザー名"
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            width: SizeInfo.blockWidth,
                            height: 60,
                            child: TextField(
                              style: TextStyle(
                                  fontSize: 12
                              ),
                              controller: _controller7,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black)
                                  ),
                                  hintText: "ユーザー名"
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            width: SizeInfo.blockWidth,
                            height: 60,
                            child: TextField(
                              style: TextStyle(
                                  fontSize: 12
                              ),
                              controller: _controller8,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black)
                                  ),
                                  hintText: "ユーザー名"
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            width: SizeInfo.blockWidth,
                            height: 60,
                            child: TextField(
                              style: TextStyle(
                                  fontSize: 12
                              ),
                              controller: _controller9,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black)
                                  ),
                                  hintText: "ユーザー名"
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                FlatButton(
                  child: Text("スタート"),
                  onPressed: (){
                    startButtonPushed();
                  },
                )
              ],
            ),
          )
        ),
      )
    );
  }

  void startButtonPushed() {
    AppInfo.user = [];
    if (_controller1.text != "") {
      AppInfo.user.add(_controller1.text);
      if (hizumeCheck(_controller1.text)) {
        hizumeMode = true;
      }
    }
    if (_controller2.text != "") {
      AppInfo.user.add(_controller2.text);
      if (hizumeCheck(_controller2.text)) {
        hizumeMode = true;
      }
    }
    if (_controller3.text != "") {
      AppInfo.user.add(_controller3.text);
      if (hizumeCheck(_controller3.text)) {
        hizumeMode = true;
      }
    }
    if (_controller4.text != "") {
      AppInfo.user.add(_controller4.text);
      if (hizumeCheck(_controller4.text)) {
        hizumeMode = true;
      }
    }
    if (_controller5.text != "") {
      AppInfo.user.add(_controller5.text);
      if (hizumeCheck(_controller5.text)) {
        hizumeMode = true;
      }
    }
    if (_controller6.text != "") {
      AppInfo.user.add(_controller6.text);
      if (hizumeCheck(_controller6.text)) {
        hizumeMode = true;
      }
    }
    if (_controller7.text != "") {
      AppInfo.user.add(_controller7.text);
      if (hizumeCheck(_controller7.text)) {
        hizumeMode = true;
      }
    }
    if (_controller8.text != "") {
      AppInfo.user.add(_controller8.text);
      if (hizumeCheck(_controller8.text)) {
        hizumeMode = true;
      }
    }
    if (_controller9.text != "") {
      AppInfo.user.add(_controller9.text);
      if (hizumeCheck(_controller9.text)) {
        hizumeMode = true;
      }
    }
    if (AppInfo.user.length == 0) {
      return;
    }else{
      if (AppInfo.user.length == 1){
        errorDialog(context);
      }else{
        if (hizumeMode == true) {
          hizumeDialog();
        }else{
          AppInfo.title = "AngryMonster";
          Monster.image = "assets/images/monster/normal";
          clearText();
          Navigator.pushReplacementNamed(context, '/start');
        }
      }
    }
  }
  /// ユーザー名をリセット
  void clearText() {
    _controller1.clear();
    _controller2.clear();
    _controller3.clear();
    _controller4.clear();
    _controller5.clear();
    _controller6.clear();
    _controller7.clear();
    _controller8.clear();
    _controller9.clear();
  }

  void hizumeDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: Text("Warning !!!!"),
          content: Text("ユーザーにひづめさんがいるとモンスターが変化します。準備はいいですか？"),
          actions: <Widget>[
            // ボタン領域
            FlatButton(
              child: Text(
                  "いや、やめとく",
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
                  "大丈夫！",
                  style: TextStyle(
                      color: Colors.black54
                  )
              ),
              onPressed: (){
                AppInfo.title = "AngryHizume";
                Monster.image = "assets/images/monster/hizume";
                clearText();
                Navigator.pushNamedAndRemoveUntil(context, '/start', ModalRoute.withName('/'));
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
          title: Text("Warning!!!!"),
          content: Text("ひとりでも遊べますが、、、一人でやります？"),
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
                clearText();
                Navigator.pushReplacementNamed(context, '/start');
              } ,
            ),
          ],
        );
      },
    );
  }

  getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.get("allCount") == null) {
      setState(() {
        AppInfo.allCount = 0;
      });
    }else{
      setState(() {
        AppInfo.allCount = pref.get("allCount");
      });
    }
  }

  bool hizumeCheck(String name) {
    if (name == "hizume"
        || name == "日詰"
        || name == "ひずめ"
        || name == "ひづめ"
        || name == "ヒズメ"
        || name == "ヒヅメ"
        || name == "蹄"
        || name == "ひじゅめ"
    ) {
      return true;
    }else{
      return false;
    }
  }
}