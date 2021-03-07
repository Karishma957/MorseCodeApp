import 'package:flutter/material.dart';
import 'package:pasc_event_project/screens/instruction_screen.dart';
import './special_chat_screen.dart';
import './normal_chat_screen.dart';
import './instruction_screen.dart';

class HomePage extends StatelessWidget {
  final searchValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        toolbarHeight: 100,
        title: Center(child: Text('Morse-English Chat')),
        elevation: 0,
        actions: [IconButton(icon: Icon(Icons.info), onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>InstructionScreen()))),],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SpecialChatScreen()));
              },
              child: Container(
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.indigo[700],
                      Colors.indigo[600],
                      Colors.indigo[700],
                    ],
                  ),
                  boxShadow: [BoxShadow(color: Colors.black26,offset: Offset(7,7),blurRadius: 7)],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    'Morse to Text',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NormalChatScreen()));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.indigo[700],
                      Colors.indigo[600],
                      Colors.indigo[700],
                    ],
                  ),
                  boxShadow: [BoxShadow(color: Colors.black26,offset: Offset(7,7),blurRadius: 7)],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    'Text to Morse',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
