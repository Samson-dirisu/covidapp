import 'package:covidapp/Utils/custom_color.dart';
import 'package:flutter/material.dart';

class MythBusters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MYTH BUSTERS'),
        centerTitle: false,
        backgroundColor: CustomColor.appBarBlue,
      ),

      backgroundColor: Colors.white,
      
    );
  }
}