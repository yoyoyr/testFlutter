import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_json_demo/widget/inherite/Button.dart';

import 'Button2.dart';
import 'ShareDataWidget.dart';
import 'TestWidget.dart';

class InheritedWidgetTestRoute extends StatefulWidget {
  @override
  _InheritedWidgetTestRouteState createState() =>
      new _InheritedWidgetTestRouteState();
}

class _InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    print("test build");
    return Center(
      child: Column(
        children: <Widget>[
          ShareDataWidget(
            //使用ShareDataWidget
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: TestWidget(), //子widget中依赖ShareDataWidget
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Button(), //子widget中依赖ShareDataWidget
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Button2(), //子widget中依赖ShareDataWidget
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: InkWell(
                    child: Text("page setState"),
                    onTap: () {
                      setState(() {});
                    },
                  ), //子widget中依赖ShareDataWidget
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
