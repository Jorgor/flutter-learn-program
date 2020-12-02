import 'package:flutter/material.dart';
import 'dart:async';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingState createState() => new _LoadingState();
}

class _LoadingState extends State<LoadingPage> {
  @override
  void initeState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      print("通讯界面....");
      Navigator.of(context).pushReplacementNamed("app");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          Image.asset("images/loading.jpeg", fit: BoxFit.cover)
        ],
      ),
    );
  }
}
