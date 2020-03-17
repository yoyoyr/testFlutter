import 'package:flutter/material.dart';

import '../../Tokens.dart';

typedef void OnTouchCallback(int index);

class Contact extends StatefulWidget {
  final List<Tokens> data;
  final double suspensionHeight;
  final double itemHeight;

  Contact({this.data, this.suspensionHeight = 20.0, this.itemHeight = 40.0});

  @override
  State createState() {
    return new _ContactState();
  }
}

class _ContactState extends State<Contact> {
  ScrollController scrollController = new ScrollController();
  List<String> indexTagList = new List();
  List<Tokens> tokens = new List();
  int defaultIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      double position = scrollController.offset.toDouble();
      int index = _computerIndex(position);
      setState(() {
        defaultIndex = index;
      });
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void _initIndexBarData() {
    indexTagList.clear();
    print("data = ${widget.data.length}");
    widget.data?.forEach((v) {
      indexTagList.add(v.tokenName.toString().toUpperCase());
    });
  }

  int _computerIndex(double position) {
    if (widget.data != null) {
      for (int i = 0; i < widget.data.length - 1; i++) {
        double pre = _computerIndexPosition(i);
        double next = _computerIndexPosition(i + 1);
        if (position > pre && position < next) {
          return i;
        }
      }
    }
    return 0;
  }

  double _computerIndexPosition(int index) {
    int n = 0;
    if (widget.data != null) {
      for (int i = 0; i < index; i++) {
        n += (widget.data[i].accounts.length).toInt();
      }
    }
    return n * widget.itemHeight + (index + 1) * widget.suspensionHeight;
  }

  void _initUserData() {
    tokens.clear();
    widget.data?.forEach((user) {
      tokens.add(user);
    });
  }

  void _onTouchCallback(int index) {
    scrollController.jumpTo(_computerIndexPosition(index)
        .clamp(.0, scrollController.position.maxScrollExtent));
    setState(() {
      defaultIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    _initIndexBarData();
    _initUserData();

    return new Stack(
      children: <Widget>[
        new Container(
          child: new Column(
            children: <Widget>[
              new Expanded(
                  child: new ListView.builder( //列表
                itemBuilder: (context, index) {
                  return new Column(
                    children: <Widget>[
                      new Suspension( //所在组  如A，B，C
                        tag: tokens[index].tokenName.toString().toUpperCase(),
                      ),
                      new AccountList(
                        accountList: tokens[index].accounts,
                        itemHeight: widget.itemHeight,
                      )
                    ],
                  );
                },
                itemCount: tokens.length,
                controller: scrollController,
              ))
            ],
          ),
        ),
      ],
    );
  }
}

class Suspension extends StatelessWidget {
  final String tag;
  final double suspensionHeight;

  Suspension({this.tag, this.suspensionHeight});

  @override
  Widget build(BuildContext context) {
    return Offstage(
      child: new Container(
        child: new Text(
          "$tag",
        ),
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(left: 16.0),
        height: suspensionHeight,
      ),
      offstage: false,
    );
  }
}

class AccountList extends StatefulWidget {
  final List<Account> accountList;
  final double itemHeight;

  AccountList({this.accountList, this.itemHeight});

  @override
  State createState() {
    return new _AccountListState();
  }
}

class _AccountListState extends State<AccountList> {
  List<Widget> children = new List();

  void _initAccountData() {
    children.clear();
    widget.accountList?.forEach((v) {
      children.add(new AccountDetail(
        accountDetail: v,
        itemHeight: widget.itemHeight,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    _initAccountData();
    return new Column(
      children: children,
    );
  }
}

//item详细布局
class AccountDetail extends StatefulWidget {
  final Account accountDetail;
  final double itemHeight;

  AccountDetail({this.accountDetail, this.itemHeight});

  @override
  State createState() {
    return new _AccountDetailState();
  }
}

class _AccountDetailState extends State<AccountDetail> {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {},
      child: new Container(
        child: new ListTile(
          title: new Text("${widget.accountDetail.name}"),
        ),
        height: widget.itemHeight,
      ),
    );
  }
}