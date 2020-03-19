import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FutureBuilderTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Text("waiting"),
            );
          } else if (snapshot.connectionState == ConnectionState.active) {
            return Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Text("active"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Text(snapshot.data.toString()),
            );
          } else {
            return Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Text("else"),
            );
          }
        },
        future: _loadData(),
      ),
    );
  }

  Future<String> _loadData() async {
    return Future.delayed(new Duration(seconds: 5)).then((_) {
      return "delay 2";
    });
  }
}
