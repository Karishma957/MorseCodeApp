import 'package:flutter/material.dart';
import 'dart:async';

class SpecialHomePage extends StatefulWidget {
  @override
  _SpecialHomePageState createState() => _SpecialHomePageState();
}

class _SpecialHomePageState extends State<SpecialHomePage> {
  var messageFormed = '';
  List letters = [];
  List word = [];
  double initialX = 0.0;
  double distanceX = 0.0;
  double initialY = 0.0;
  double distanceY = 0.0;
  Timer timer;
  int timePassed = 0;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    timer = new Timer.periodic(oneSec, (Timer timer) {
      setState(() {
        timePassed++;
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void resetTimer() {
    timePassed = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: GestureDetector(
        //time stop,time compare,time reset, and append letter
        onTapDown: (_) {
          if (timer != null) timer.cancel();
          if (timePassed > 3) {
            letters.add(messageFormed);
            print(letters);
            setState(() {
              messageFormed = '';
            });
          }
          resetTimer();
        },
        //append message string,start time
        onTapUp: (_) {
          setState(() {
            messageFormed += '.';
          });
          startTimer();
        },
        //time stop,time compare,time reset, and append letter
        onLongPressStart: (_) {
          if (timer != null) timer.cancel();
          if (timePassed > 5) {
            letters.add(messageFormed);
            print(letters);
            setState(() {
              messageFormed = '';
            });
          }
          resetTimer();
        },
        //append message string,start time
        onLongPressEnd: (_) {
          setState(() {
            messageFormed += '-';
          });
          startTimer();
        },
        onHorizontalDragStart: (DragStartDetails details) {
          initialX = details.globalPosition.dx;
        },
        onHorizontalDragUpdate: (DragUpdateDetails details) {
          distanceX = details.globalPosition.dx - initialX;
        },
        onHorizontalDragEnd: (DragEndDetails detail) {
          if (timer != null) timer.cancel();
          initialX = 0;
          initialY = 0;
          //left swipe
          //timer stop, reset
          //message empty string
          if (distanceX.isNegative) {
            print('erased');
          }
          //right swipe
          //timer stop, reset
          //letter append, word append=' ' , word append letters list, letter=[],message='',
          else {
            letters.add(messageFormed);
            word.add(letters);
            word.add([' ']);
            letters=[];
            print('space');
          }
          setState(() {
            messageFormed = '';
          });
          resetTimer();
        },
        onVerticalDragStart: (DragStartDetails details) {
          initialY = details.globalPosition.dy;
        },
        onVerticalDragUpdate: (DragUpdateDetails details) {
          distanceY = details.globalPosition.dy - initialY;
        },
        onVerticalDragEnd: (DragEndDetails detail) {
          if (timer != null) timer.cancel();
          initialY = 0;
          initialX = 0;
          //upward swipe
          //timer stop, reset
          //letter append,word append,print word, empty all 3
          if (distanceY.isNegative) {
            letters.add(messageFormed);
            word.add(letters);

            print(word);
            word=[];
            letters=[];
            print('sent');
          }
          //downward swipe
          //timer stop, reset
          //letter append,word append, word append \n,empty letter,empty message
          else {
            letters.add(messageFormed);
            word.add(letters);
            word.add(['\n']);
            letters=[];
            print('newline');
          }
          setState(() {
            messageFormed = '';
          });
          distanceX = 0;
          distanceY = 0;
          resetTimer();
        },
        behavior: HitTestBehavior.opaque,
        child: Container(
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              messageFormed,
              style: Theme.of(context).textTheme.headline6,
              overflow: TextOverflow.clip,
            ),
          ),
        ),
      ),
    );
  }
}