import 'package:flutter/material.dart';
import './screens/sign_up_page.dart';
import './screens/normal_home_page.dart';
import './screens/log_in_page.dart';
import './screens/special_chat_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        backgroundColor: Color.fromRGBO(48, 48, 72, 1),
        iconTheme: IconThemeData(
          color: Color.fromRGBO(72, 96, 144, 1),
        ),
        canvasColor: Color.fromRGBO(48, 48, 72, 1),
        buttonColor: Colors.indigo,
        appBarTheme: AppBarTheme(
            color: Colors.transparent,
            textTheme: TextTheme(
              headline6: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  letterSpacing: 1.5),
            )),
        fontFamily: 'OpenSans',
        textTheme: TextTheme(
          bodyText1: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              color: Colors.white60),
          headline6: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.w700,
              color: Colors.white70,
              letterSpacing: 1.5),
          bodyText2: TextStyle(fontSize: 18.0, color: Colors.white54),
          caption: TextStyle(fontSize: 18.0, color: Colors.white60),
        ),
        accentColor: Color.fromRGBO(24, 48, 96, 1),
        primaryColor: Color.fromRGBO(0, 24, 48, 1),
      ),
      debugShowCheckedModeBanner: false,
      home: SpecialChatScreen(),
    );
  }
}