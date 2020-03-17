import 'package:flutter/cupertino.dart';

class ShareDataInheriteWidget extends InheritedWidget {
  ShareDataInheriteWidget({Widget child, this.data, this.update})
      : super(child: child);

  int data;
  Function update;

  void setData(int d) {
    update(d);
  }

  //该回调决定当data发生变化时，是否通知子树中依赖data的Widget
  @override
  bool updateShouldNotify(ShareDataInheriteWidget old) {
    //如果返回true，则子树中依赖(build函数中有调用)本widget
    //的子widget的`state.didChangeDependencies`会被调用
    return true;
  }
}

class ShareDataWidget extends StatefulWidget {
  Widget child;
  int data; //需要在子树中共享的数据，保存点击次数

  ShareDataWidget({this.child, this.data});

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataInheriteWidget of(BuildContext context, bool listener) {
//    return listener
//        ? context.dependOnInheritedWidgetOfExactType<ShareDataInheriteWidget>()
//        : context
//            .getElementForInheritedWidgetOfExactType<ShareDataInheriteWidget>()
//            .widget;
    return context
        .dependOnInheritedWidgetOfExactType<ShareDataInheriteWidget>();
  }

  @override
  _ShareDataWidgetState createState() => _ShareDataWidgetState();
}

class _ShareDataWidgetState extends State<ShareDataWidget> {
  @override
  Widget build(BuildContext context) {
    return ShareDataInheriteWidget(
      child: widget.child,
      data: widget.data,
      update: _setData,
    );
  }

  void _setData(int d) {
    widget.data = d;
    setState(() {});
  }
}
