import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_json_demo/widget/inherite/ShareDataWidget.dart';

class Button2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("button222 build");
    return Center(
      child: Text("button2"),
    );
  }
}

//class Button2 extends StatefulWidget {
//  @override
//  _Button2State createState() => _Button2State();
//}
//
//class _Button2State extends State<Button2> {
//  @override
//  Widget build(BuildContext context) {
//    print("button2 build");
//    return Center(
//      child: Text("button2"),
//    );
//  }
//}
