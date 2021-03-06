import 'package:flutter/material.dart';
import 'dart:async';
import '../services/morseCode.dart';
import 'package:vibration/vibration.dart';

class SpecialChatScreen extends StatefulWidget {
  @override
  _SpecialChatScreenState createState() => _SpecialChatScreenState();
}

class _SpecialChatScreenState extends State<SpecialChatScreen> {
  String testMessage = 'I am here';
  String messageFormed = '';
  String stringFormed = '';
  double initialX = 0.0;
  double distanceX = 0.0;
  double initialY = 0.0;
  double distanceY = 0.0;
  Timer timer;
  int timePassed = 0;

  Map lastMessage = {
    'sender': 'not me',
    'data': 'hello there. how are you, long time no see i have been looking for you',
    'time': DateTime.now().toString()
  };

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

  void vibrateMorse(pattern) {
    Vibration.vibrate(
      pattern: pattern,
    );
  }

  void executeVibrate(List<String> mList) {
    List<int> vibrationPattern = [];
    print(mList);
    int pause = 0;
    for (int j = 0; j < mList.length; j++) {
      pause += 600;
      for (int i = 0; i < mList[j].length; i++) {
        if (mList[j][i] == '.') {
          vibrationPattern.add(pause);
          vibrationPattern.add(400);
          pause = 600;
        } else if (mList[j][i] == '-') {
          vibrationPattern.add(pause);
          vibrationPattern.add(800);
          pause = 600;
        } else {
          pause = 2400;
        }
      }
    }
    print(vibrationPattern);
    vibrateMorse(vibrationPattern);
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
          if (timePassed >= 2) {
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
              Container(
                margin: lastMessage['sender']=='me'
                    ? EdgeInsets.only(
                        top: 8.0,
                        bottom: 8.0,
                        left: 80.0,
                      )
                    : EdgeInsets.only(
                        top: 8.0,
                        bottom: 8.0,
                      ),
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                width: MediaQuery.of(context).size.width * 0.75,
                decoration: BoxDecoration(
                  color:
                  Colors.blue[600],
                  borderRadius: lastMessage['sender']=='me'
                      ? BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          bottomLeft: Radius.circular(15.0),
                        )
                      : BorderRadius.only(
                          topRight: Radius.circular(15.0),
                          bottomRight: Radius.circular(15.0),
                        ),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 8.0),
                    Text(
                      lastMessage['data'],
                      style: Theme.of(context).textTheme.bodyText1
                    ),
                    SizedBox(height: 8,),
                    Text(
                        lastMessage['time'],
                        style: TextStyle(
                          fontSize: 8,
                          color: Colors.white54
                        )
                    ),
                  ],
                ),
              ),
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
      ]
          ),
        ),
      ),
    );
  }
}
