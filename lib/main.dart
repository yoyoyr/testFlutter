import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_json_demo/widget/FutureBuilderTest/FutureBuilderTest.dart';
import 'package:flutter_json_demo/widget/inherite/InheritedWidgetTestRoute.dart';
import 'package:flutter_json_demo/widget/inherite/ShareDataWidget.dart';
import 'package:flutter_json_demo/widget/inherite/TestWidget.dart';
import 'package:flutter_json_demo/widget/notifcation/NotificationRouter.dart';
import 'package:flutter_json_demo/widget/providers/ProviderRoute.dart';
import 'package:flutter_json_demo/widget/theme/ThemeTestRoute.dart';

import 'Tokens.dart';
import 'widget/inherite/Contact.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new _MyAppWidget(),
    );
  }
}

class _MyAppWidget extends StatefulWidget {
  @override
  State createState() {
    return new _MyAppState();
  }
}

class _MyAppState extends State<_MyAppWidget> {
  String jsonStr;
  List<String> names;
  List<Widget> widgets;

  void _loadJson() async {
    names = ["ProviderRoute", "InheritedWidgetTestRoute", "NotificationRouter","FutureBuilder"];
    widgets = [
      ProviderRoute(),
      InheritedWidgetTestRoute(),
      NotificationRouter(),
      FutureBuilderTest(),
    ];
    print("name = ${names.length}");
    print("widgets = ${widgets.length}");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadJson();
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return new Scaffold(
      appBar: AppBar(),
      body: ListView.builder(itemBuilder: (content, index) {
        return Container(
          margin: EdgeInsets.all(20),
          child: InkWell(
            child: Text(names[index]),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return widgets[index];
              }));
            },
          ),
        );
      },itemCount: names.length,),
    );
  }
}

