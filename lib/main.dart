import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import './screens/normal_home_page.dart';
import './screens/special_home_page.dart';
import './screens/log_in_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        iconTheme: IconThemeData(
          color: Color.fromRGBO(24, 48, 96, 1),
        ),
        canvasColor: Colors.white,
        buttonColor: Colors.lightBlueAccent,
        appBarTheme: AppBarTheme(
            color: Colors.transparent,
            textTheme: TextTheme(
              headline6: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w700,color: Colors.white,letterSpacing: 1.5),
            )),
        fontFamily: 'OpenSans',
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600,color: Color.fromRGBO(0, 24, 48, 1)),
          headline6: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700,color: Colors.black,letterSpacing: 1.5),
          bodyText2: TextStyle(
              fontSize: 18.0,
              color: Color.fromRGBO(0, 24, 48, 1)
          ),
          caption: TextStyle(
              fontSize: 18.0,
              color: Colors.black26
          ),
        ),
        accentColor: Color.fromRGBO(72, 96, 144, 1),
        primaryColor: Color.fromRGBO(48, 48, 72, 1),
      ),
      dark: ThemeData(
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
              headline6: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w700,color: Colors.white,letterSpacing: 1.5),
            )),
        fontFamily: 'OpenSans',
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600,color: Colors.white60),
          headline6: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700,color: Colors.white70,letterSpacing: 1.5),
          bodyText2: TextStyle(
              fontSize: 18.0,
              color: Colors.white54
          ),
          caption: TextStyle(
              fontSize: 18.0,
              color: Colors.black26
          ),
        ),
        accentColor: Color.fromRGBO(24, 48, 96, 1),
        primaryColor: Color.fromRGBO(0, 24, 48, 1),
      ),
      initial: AdaptiveThemeMode.dark,
      builder: (theme, darkTheme) => MaterialApp(
        theme: theme,
        darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,
        home: LogInPage(),//SpecialHomePage(),NormalHomePage(),
      ),
    );
  }
}
/*
* #486090	rgb (72, 96, 144)	Last Light Blue
#183060	rgb (24, 48, 96)	Ending Navy Blue
#001830	rgb (0, 24, 48)	Squid Ink Powder
#303048	rgb (48, 48, 72)	Blue Regal
* */
