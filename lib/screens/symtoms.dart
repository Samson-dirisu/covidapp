import 'package:covidapp/Utils/custom_color.dart';
import 'package:flutter/material.dart';

class Symtoms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(

            title: Text("COVID19 SYMTOMS", style: TextStyle(
              color: CustomColor.backgroundColor, fontWeight: FontWeight.bold,
            ),),
            backgroundColor: CustomColor.appBarBlue,
          ),
      
    );
  }
}