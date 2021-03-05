import 'package:flutter/material.dart';
import 'dart:async';
import '../services/morseCode.dart';

class SpecialChatScreen extends StatefulWidget {
  @override
  _SpecialChatScreenState createState() => _SpecialChatScreenState();
}

class _SpecialChatScreenState extends State<SpecialChatScreen> {
  String messageFormed = '';
  String stringFormed = '';
  double initialX = 0.0;
  double distanceX = 0.0;
  double initialY = 0.0;
  double distanceY = 0.0;
  Timer timer;
  int timePassed = 0;

  void startTimer() {
    const oneSec = const Duration(milliseconds: 800);
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
          if (timePassed >= 2) {
            setState(() {
              if (messageFormed != '') {
                stringFormed += MorseCode.convertMorseToString(messageFormed);
              }
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
          if (timePassed >=2) {
            setState(() {
              stringFormed += MorseCode.convertMorseToString(messageFormed);
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
            setState(() {
              messageFormed = '';
            });
            print('erased');
          }
          //right swipe
          //timer stop, reset
          //letter append, word append=' ' , word append letters list, letter=[],message='',
          else {
            setState(() {
              stringFormed += MorseCode.convertMorseToString(messageFormed);
              stringFormed += ' ';
              messageFormed = '';
            });
            print('space');
          }
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
            setState(() {
              stringFormed += MorseCode.convertMorseToString(messageFormed);
              messageFormed = '';
            });
            print(stringFormed);
            print('sent');
          }
          //downward swipe
          //timer stop, reset
          //letter append,word append, word append \n,empty letter,empty message
          else {
            setState(() {
              stringFormed += MorseCode.convertMorseToString(messageFormed);
              stringFormed += '\n';
              messageFormed = '';
            });
            print('newline');
          }

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                messageFormed,
                style: Theme.of(context).textTheme.headline6,
                overflow: TextOverflow.clip,
              ),
              Text(
                stringFormed,
                style: Theme.of(context).textTheme.headline6,
                overflow: TextOverflow.clip,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
