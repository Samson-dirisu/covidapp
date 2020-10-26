import 'dart:convert';

import 'package:covidapp/Utils/custom_color.dart';
import 'package:covidapp/models/country_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class CountryScreen extends StatefulWidget {
  @override
  _CountryScreenState createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  List countries;

  @override
  void initState() {
    super.initState();
    fetchCountryData();
  }

  // url to fecth country data
  Future fetchCountryData() async {
    final String _url = "http://disease.sh/v3/covid-19/countries";
    Response response = await get(Uri.encodeFull(_url));

    if (response.statusCode == 200) {
      setState(() {
        countries = json.decode(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // app bar
        appBar: AppBar(
          title: Text("List of Affected Countries"),
          backgroundColor: CustomColor.appBarBlue,
          centerTitle: false,
        ),

        // backgroundcolor of the screen
        backgroundColor: Colors.white,

        //body of the screen
        body: ListView(
                  children:[ Container(
                    alignment: Alignment.center,
              child: countries == null
                  ? Center(
                    child: CircularProgressIndicator())
                  : listOfCountries()),
                   ] )
        );
  }

// a customized method returning the list of countries as a widget
  Widget listOfCountries() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,

      //Data table
          child: DataTable(
            columnSpacing: 20.0,
            sortAscending: true,

          // Starting of Column
          columns: [
            // Country column
            DataColumn(
                label: Text("Countries",
                    style: TextStyle(fontWeight: FontWeight.bold))),

            // Active column
            DataColumn(
                label: Text(
              "Active",
              style: TextStyle(
                color: CustomColor.customYellow,
                fontWeight: FontWeight.bold,
              ),
            )),

            //Recovered Column
            DataColumn(
                label: Text("Recovered",
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold))),

            //Deaths column            
            DataColumn(
                label: Text(
              "Deaths",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ))
          ],

          //Stating of rows
          rows: countries
              .map((country) => DataRow(cells: [
                    DataCell(Text(country['country'], style: TextStyle(fontWeight: FontWeight.bold),)),
                    DataCell(Text(country['active'].toString(), style: TextStyle(fontWeight: FontWeight.bold))),
                    DataCell(Text(country['recovered'].toString(), style: TextStyle(fontWeight: FontWeight.bold))),
                    DataCell(Text(country['deaths'].toString(), style: TextStyle(fontWeight: FontWeight.bold)))
                  ]))
              .toList()),
    );
  }
}
