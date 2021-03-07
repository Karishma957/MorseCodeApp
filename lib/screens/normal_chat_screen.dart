import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import '../services/morseCode.dart';

class NormalChatScreen extends StatefulWidget {
  @override
  _NormalChatScreenState createState() => _NormalChatScreenState();
}

class _NormalChatScreenState extends State<NormalChatScreen> {
  String message = '';
  String outputString = '';

  void vibrateMorse(pattern) {
    Vibration.vibrate(
      pattern: pattern,
    );
  }

  void executeVibrate(List<String> mList) {
    List<int> vibrationPattern = [];
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
    vibrateMorse(vibrationPattern);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Text to Morse'),
        ),
        body: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    message.length == 0
                        ? Container()
                        : Center(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25.0, vertical: 15.0),
                              width: MediaQuery.of(context).size.width * 0.75,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).accentColor,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                children: [
                                  Text('Text Sent :',
                                      style: Theme.of(context).textTheme.caption),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(message,
                                      style:
                                          Theme.of(context).textTheme.bodyText1),
                                ],
                              ),
                            ),
                          ),
                    message.length == 0
                        ? Container()
                        : Center(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25.0, vertical: 15.0),
                              width: MediaQuery.of(context).size.width * 0.75,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).accentColor,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                children: [
                                  Text('Morse Code Sent :',
                                      style: Theme.of(context).textTheme.caption),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                      MorseCode.convertStringToMorse(
                                              message.toUpperCase())
                                          .join(" "),
                                      style:
                                          Theme.of(context).textTheme.bodyText1),
                                ],
                              ),
                            ),
                          ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: TextField(
                          onChanged: (v) {
                            outputString = v;
                          },
                          style: Theme.of(context).textTheme.bodyText1,
                          decoration: InputDecoration(
                            hintText: 'Type a message',
                            filled: true,
                            fillColor: Colors.blue[400],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.all(8),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    RawMaterialButton(
                      onPressed: () {
                        setState(() {
                          message = outputString;
                          outputString = '';
                        });
                        executeVibrate(MorseCode.convertStringToMorse(
                            message.toUpperCase()));
                      },
                      fillColor: Colors.indigo,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          'SEND',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
