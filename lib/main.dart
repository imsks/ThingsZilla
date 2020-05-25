import 'package:flutter/material.dart';
import 'package:thingszilla/screens/splashscreen.dart';
import 'package:thingszilla/screens/components/homepage.dart';
import 'package:thingszilla/constants.dart';

void main() => runApp(ThingsZilla());

class ThingsZilla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ThingsZilla',
      // debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.blue,
        canvasColor: kSecondaryColor,
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: kSecondaryColor
        )
      ),
      home: SplashScreen(),
      routes: {
        HomePage.id: (context) => HomePage(),
      },
    );
  }
}
