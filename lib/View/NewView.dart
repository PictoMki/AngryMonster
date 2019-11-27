import '../Model/sizeInfo.dart';
import 'package:flutter/material.dart';

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

  var _userCount = 0;
  var listView;
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    listView = ListView();
  }

  @override
  Widget build(BuildContext context) {
    sizeInfo.displayWidth = MediaQuery.of(context).size.width;
    sizeInfo.displayHeight = MediaQuery.of(context).size.height;
    sizeInfo.blockPadding = 10;
    sizeInfo.blockSize = sizeInfo.displayWidth / 3 - sizeInfo.blockPadding * 3;
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_focusNode),
      child: Scaffold(
        appBar: AppBar(
          title: Text("AngryMonster"),
        ),
        body: Center(
          child: Container(
            width: sizeInfo.displayWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                    "参加するメンバーを入力して！",
                  style: TextStyle(
                    fontSize: 24
                  ),
                ),
                Container(
                  width: sizeInfo.displayWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            width: sizeInfo.blockSize,
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
                            width: sizeInfo.blockSize,
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
                            width: sizeInfo.blockSize,
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
                            width: sizeInfo.blockSize,
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
                            width: sizeInfo.blockSize,
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
                            width: sizeInfo.blockSize,
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
                            width: sizeInfo.blockSize,
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
                            width: sizeInfo.blockSize,
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
                            width: sizeInfo.blockSize,
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
                    Navigator.pushNamed(context, '/start');
                  },
                )
              ],
            ),
          )
        ),
      )
    );
  }
}