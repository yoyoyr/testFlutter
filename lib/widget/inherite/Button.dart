import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_json_demo/widget/inherite/ShareDataWidget.dart';

class Button extends StatefulWidget {
  Function onTap;

  Button({this.onTap});

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    print("button build");
    return InkWell(
      child: Center(
        child: Text("add"),
      ),
      onTap: () {
        ShareDataWidget.of(context, false).setData(10);
      },
    );
  }
}
