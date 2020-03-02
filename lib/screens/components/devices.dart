import 'package:flutter/material.dart';

class DevicesScreen extends StatefulWidget {
  static const String id = '/devices';

  @override
  _DevicesScreenState createState() => _DevicesScreenState();
}

class _DevicesScreenState extends State<DevicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Devices'
      ),
    );
  }
}
