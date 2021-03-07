import 'package:flutter/material.dart';
class InstructionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instructions'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('1. Morse to text ',style: Theme.of(context).textTheme.subtitle2,),
              Divider(),
              Text('a)Tap for dot\nb)Long press for dash\nc)Enter new letter after an interval of 1 second\nd)Swipe left to erase the currently typing letter\ne)Swipe right to enter space\nf)Swipe down for new line\ng)Swipe up to convert to text',style: Theme.of(context).textTheme.bodyText1,),
              Divider(height: 70,),
              Text('2. Text to Morse ',style: Theme.of(context).textTheme.subtitle2,),
              Divider(),
              Text('a)Enter text in the text field\nb)On clicking send, the message and it\'s morse code will be displayed\nc)The morse code will be converted to vibration of phone',style: Theme.of(context).textTheme.bodyText1,),
            ],
          )
        ),
      ),
    );
  }
}
