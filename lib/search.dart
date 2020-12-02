// import 'dart:html';

import 'package:flutter/material.dart';
import './common/touch_callback.dart';

class Search extends StatefulWidget {
  @override
  SearchState createState() => new SearchState();
}

class SearchState extends State<Search> {
  FocusNode focusNode = new FocusNode();

  _reqFocus() {
    FocusScope.of(context).requestFocus(focusNode);
    return focusNode;
  }

  _getText(String text) {
    return TouchCallBack(
      isfeed: false,
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(fontSize: 14, color: Color(0xff1aad19)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                TouchCallBack(
                  isfeed: false,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 45,
                    margin: const EdgeInsets.only(left: 12, right: 12),
                    child: Icon(
                      Icons.chevron_left,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 45,
                  margin: const EdgeInsets.only(left: 50, right: 10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1, color: Colors.green))),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: TextField(
                        focusNode: _reqFocus(),
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        onChanged: (String text) {},
                        decoration: InputDecoration(
                            hintText: '像素', border: InputBorder.none),
                      )),
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.mic,
                          color: Color(0xffaaaaa),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: Text(
                '常用搜索',
                style: TextStyle(fontSize: 16, color: Color(0xffb5b5b5)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _getText('朋友'),
                  _getText('聊天'),
                  _getText('群组'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _getText('朋友'),
                  _getText('聊天'),
                  _getText('群组'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
