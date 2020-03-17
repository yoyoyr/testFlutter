import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_json_demo/widget/notifcation/MyNotification.dart';

class NotificationRouter extends StatefulWidget {
  @override
  _NotificationRouterState createState() => _NotificationRouterState();
}

class _NotificationRouterState extends State<NotificationRouter> {
  String _msg = "";

  @override
  Widget build(BuildContext context) {
    return NotificationListener<MyNotification>(
        onNotification: (notifiction) {
          print("father msg = ${notifiction.msg}");
          setState(() {
            _msg += notifiction.msg + "  ";
          });
          return true;
        },
        child: NotificationListener<MyNotification>(
          onNotification: (notifiction) {
            print("son msg = ${notifiction.msg}");
            return false;
          },
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Builder(
                  builder: (context) {
                    return RaisedButton(
                      //按钮点击时分发通知
                      onPressed: () => MyNotification("Hi").dispatch(context),
                      child: Text("Send Notification"),
                    );
                  },
                ),
                Text(_msg)
              ],
            ),
          ),
        ));
  }
}
