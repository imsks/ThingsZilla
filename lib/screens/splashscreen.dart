import 'package:flutter/material.dart';
import 'dart:async';
import 'package:thingszilla/constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(
        const Duration(seconds: 1),
            () => Navigator.pushReplacementNamed(context, '/home')
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kSecondaryColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'ThingsZilla',
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'Montserrat',
                  color: kWhiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
