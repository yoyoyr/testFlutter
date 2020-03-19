import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

//滑动冲突
class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      gestures: {
        AllowMultipleGestureRecognizer: GestureRecognizerFactoryWithHandlers<
            AllowMultipleGestureRecognizer>(
          () => AllowMultipleGestureRecognizer(),
          (AllowMultipleGestureRecognizer instance) {
            instance.onTap =
                () => print('Episode 4 is best! (parent container) ');
          },
        )
      },
      behavior: HitTestBehavior.opaque,
      //Parent Container
      child: Container(
        color: Colors.blueAccent,
        child: Center(
          //Wraps the second container in RawGestureDetector
          child: RawGestureDetector(
            gestures: {
              AllowMultipleGestureRecognizer:
                  GestureRecognizerFactoryWithHandlers<
                      AllowMultipleGestureRecognizer>(
                () => AllowMultipleGestureRecognizer(), //constructor
                (AllowMultipleGestureRecognizer instance) {
                  //initializer
                  instance.onTap =
                      () => print('Episode 8 is best! (nested container)');
                },
              )
            },
            //Creates the nested container within the first.
            child: Container(
              color: Colors.yellowAccent,
              width: 300.0,
              height: 400.0,
            ),
          ),
        ),
      ),
    );
  }
}

class AllowMultipleGestureRecognizer extends TapGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}
