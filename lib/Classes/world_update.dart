import 'package:covidapp/NetworkUrl/network_url.dart';
import 'package:covidapp/Utils/custom_color.dart';
import 'package:covidapp/models/country_model.dart';
import 'package:covidapp/models/covid_model.dart';
import 'package:flutter/material.dart';

class WorldUpdate extends StatefulWidget {
  @override
  _WorldUpdateState createState() => _WorldUpdateState();
}

class _WorldUpdateState extends State<WorldUpdate> {
  Future data;
  Future data2;
  NetworkUrl networkUrl = new NetworkUrl();
  NetworkUrl networkUrl2 = new NetworkUrl();
  @override
  void initState() {
    super.initState();
    data = networkUrl.fecthWorldData();
  }

  CovidModel covidModel;
  CountryModel countryModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
            future: data,
            builder: (context, AsyncSnapshot snapshot) {
              // condition to check if snapshot has data
              if (snapshot.hasData) {
                covidModel = snapshot.data;
               // print(countryModel.active.toString());
                return worldInfoContainer(context);
              }

              // an otherwise statement
              else {
                return CircularProgressIndicator();
              }
            }),
      ],
    );
  }

  //a method returning customize widget
  Widget worldInfoContainer(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 30.0),
      height: height / 5,
      width: width ,

      // decoration of the Container
      decoration: BoxDecoration(
          color: CustomColor.appBarBlue,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.0), bottomRight: Radius.circular(30.0))),

      //child of the Container returning Row widget
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //First child of the row widget
          worldData(
              label: "Active",
              count: covidModel.active,
              colorOfLabel: CustomColor.customYellow),

          //second child of the row widget
          worldData(
              label: "Recovered",
              count: covidModel.recovered,
              colorOfLabel: Colors.green),

          //Third child of the row widget
          worldData(
              label: "Deaths",
              count: covidModel.deaths,
              colorOfLabel: Colors.red.shade700),
        ],
      ),
    );
  }

  Widget worldData({String label, int count, Color colorOfLabel}) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
              color: colorOfLabel, fontSize: 15.0, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            count.toString(),
            style: TextStyle(color: colorOfLabel, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

 
}
