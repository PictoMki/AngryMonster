import '../Model/sizeInfo.dart';
import '../Model/AppInfo.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class NewView extends StatefulWidget {
  @override
  _NewViewState createState() => _NewViewState();
}

class _NewViewState extends State<NewView>{

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
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    getData();
    listView = ListView();

  }

  @override
  Widget build(BuildContext context) {
    SizeInfo.displayWidth = MediaQuery.of(context).size.width;
    SizeInfo.displayHeight = MediaQuery.of(context).size.height;
    SizeInfo.blockPadding = 10;
    SizeInfo.blockWidth = SizeInfo.displayWidth / 3 - SizeInfo.blockPadding * 3;
    SizeInfo.blockHeight = SizeInfo.displayHeight / 9 - SizeInfo.blockPadding * 3;
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_focusNode),
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("AngryMonster"),
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
    }
    if (_controller2.text != "") {
      AppInfo.user.add(_controller2.text);
    }
    if (_controller3.text != "") {
      AppInfo.user.add(_controller3.text);
    }
    if (_controller4.text != "") {
      AppInfo.user.add(_controller4.text);
    }
    if (_controller5.text != "") {
      AppInfo.user.add(_controller5.text);
    }
    if (_controller6.text != "") {
      AppInfo.user.add(_controller6.text);
    }
    if (_controller7.text != "") {
      AppInfo.user.add(_controller7.text);
    }
    if (_controller8.text != "") {
      AppInfo.user.add(_controller8.text);
    }
    if (_controller9.text != "") {
      AppInfo.user.add(_controller9.text);
    }
    clearText();
    Navigator.pushReplacementNamed(context, '/start');
  }

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

  void stopDialog(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: Text("Warning !!!!"),
          content: Text("ひづめ、ひずめ、hizume、にくづめさんがいるとモンスターがえぐくなります。"),
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
                startButtonPushed();
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
}