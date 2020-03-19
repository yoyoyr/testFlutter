import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Drag extends StatefulWidget {
  @override
  _DragState createState() => new _DragState();
}

class _DragState extends State<Drag> with SingleTickerProviderStateMixin {
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0; //距左边的偏移

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 200, left: 100),
        child: Stack(
          children: <Widget>[
            ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  height: 50,
                  child: Text(index.toString()),
                );
              },
              itemCount: 30,
            ),
            Positioned(
              top: _top,
              left: _left,
              child: GestureDetector(
                child: CircleAvatar(child: Text("A")),
                //手指按下时会触发此回调
                onPanDown: (DragDownDetails e) {
                  //打印手指按下的位置(相对于屏幕)
                  print("用户手指按下：${e.globalPosition}");
                },
                //手指滑动时会触发此回调
                onPanUpdate: (DragUpdateDetails e) {
                  //用户手指滑动时，更新偏移，重新构建
                  setState(() {
                    if (e.delta.dx.abs() > e.delta.dy.abs()) {
                      _left += e.delta.dx;
                      _top += e.delta.dy;
                    }
                  });
                },
                onPanEnd: (DragEndDetails e) {
                  //打印滑动结束时在x、y轴上的速度
                  print(e.velocity);
                },
                behavior: HitTestBehavior.translucent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
