import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';


class TopFiveCountries extends StatefulWidget {
  @override
  _TopFiveCountriesState createState() => _TopFiveCountriesState();
}

class _TopFiveCountriesState extends State<TopFiveCountries> {
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
    
    // condition to check if there is data from the api call
    if (countries == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Container(child: listOfCountries());
    }
  }

  Widget listOfCountries() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(columns: [
        // Countries Column
        DataColumn(
            label: Text(
          "Countries",
          style: TextStyle(fontWeight: FontWeight.bold),
        )),

        // Active column
        DataColumn(
            label: Text(
          "Active",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        )),

        //Recovered column
        DataColumn(
            label: Text(
          "Recovered",
          style: TextStyle( fontWeight: FontWeight.bold),
        )),

        // Deaths column
        DataColumn(
            label: Text(
          "Deaths",
          style: TextStyle( fontWeight: FontWeight.bold),
        )),
      ],

          // Rows of table
          rows: [
            //First Row
            DataRow(cells: [
              DataCell(Text(countries[0]['country'], style: TextStyle(
                fontWeight: FontWeight.bold
              ))),
              DataCell(Text(
                countries[0]['active'].toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )),

              // First row, recovered cell
              DataCell(Text(countries[0]['recovered'].toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ))),

              // first row, deaths cell
              DataCell(Text(
                countries[0]['deaths'].toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )),
            ]),

            // Second row, country cell
            DataRow(cells: [
              DataCell(Text(countries[1]['country'], style: TextStyle(
                fontWeight: FontWeight.bold
              ))),
              DataCell(Text(
                countries[1]['active'].toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )),

              //Second row, recovered cell
              DataCell(Text(
                countries[1]['recovered'].toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )),

              //Second row, deaths cell
              DataCell(Text(countries[1]['deaths'].toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ))),
            ]),

            //Third row
            DataRow(cells: [
              //Third row, country cell
              DataCell(Text(countries[2]['country'], style: TextStyle(
                fontWeight: FontWeight.bold
              ))),

              //Third row, active cell
              DataCell(Text(
                countries[2]['active'].toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )),

              //Third row, recovered cell
              DataCell(Text(countries[2]['recovered'].toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ))),

              //Third row, deaths cell
              DataCell(Text(countries[2]['deaths'].toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ))),
            ]),

            //Fouth row
            DataRow(cells: [
              //Fouth row, country cell
              DataCell(Text(countries[3]['country'], style: TextStyle(
                fontWeight: FontWeight.bold
              ))),

              //Fouth row, active cell
              DataCell(Text(
                countries[3]['active'].toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )),

              //Fouth row, recovered cell
              DataCell(Text(countries[3]['recovered'].toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ))),

              //Fouth row, deaths cell
              DataCell(Text(countries[3]['deaths'].toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ))),
            ]),

            // Fifth row
            DataRow(cells: [
              // Fifth row, country cell
              DataCell(Text(countries[4]['country'], style: TextStyle(
                fontWeight: FontWeight.bold
              ))),

              // Fifth row, active cell
              DataCell(Text(
                countries[4]['active'].toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )),

              // Fifth row, recovered cell
              DataCell(Text(countries[4]['recovered'].toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ))),

              // Fifth row, deaths cell
              DataCell(Text(countries[4]['deaths'].toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ))),
            ])
          ]),
    );
  }
}
