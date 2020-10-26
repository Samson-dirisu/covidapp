import 'package:covidapp/Classes/category2.dart';
import 'package:covidapp/Classes/top_five_countries.dart';
import 'package:covidapp/Classes/update_category.dart';
import 'package:covidapp/Classes/world_update.dart';
import 'package:covidapp/Utils/custom_color.dart';
import 'package:covidapp/screens/countries.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Appbar
      appBar: AppBar(
        title: Text(
          "KoviTracker",
          style: TextStyle(color: CustomColor.backgroundColor),
        ),
        centerTitle: false,
        backgroundColor: CustomColor.appBarBlue,
      ),

      //backgroundcolor of the app
      backgroundColor: Colors.white,

      //app body
      body: ListView(children: [
        Column(
          children: [
            WorldUpdate(),
            image(),
            categoryLabel(label: "Countries", screen: CountryScreen(), 
              child: Icon(
                FontAwesomeIcons.arrowRight, size: 16,
                color: CustomColor.appBarBlue
                )),
            TopFiveCountries(),
            categoryLabel(
              label: "Updates",
            ),
            UpdateCategory(),
            categoryLabel(label: "Things to know"),
            SecondCategory(),
          ],
        ),
      ]),
    );
  }

  //label in between each section
  Widget categoryLabel({String label, Widget screen, Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
                color: CustomColor.appBarBlue,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
          InkWell(
            splashColor: Colors.black,
            child: Container(child: child),
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return screen;
            })),
          )
        ],
      ),
    );
  }

  Widget image() {
      return Container(
        alignment: Alignment.center,
              child: Container(
          height: MediaQuery.of(context).size.height/ 3,
          width: MediaQuery.of(context).size.width/1,
          decoration: BoxDecoration(
           // color: Colors.red,
              image: DecorationImage(
                  image: AssetImage("images/covidgirlsitting.jpg"))),
        ),
      );
    }
}
