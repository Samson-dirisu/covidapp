import 'dart:convert';

import 'package:covidapp/models/covid_model.dart';
import 'package:http/http.dart';

class NetworkUrl {
// url to fecth world data
  Future fecthWorldData() async {
    final String _url = "http://disease.sh/v3/covid-19/all";
    Response response = await get(Uri.encodeFull(_url));

    if (response.statusCode == 200) {
      var worldData = json.decode(response.body);
      return CovidModel.fromJson(worldData);
    } else {
      return print(response.statusCode);
    }
  }

// // url to fecth country data
//   Future fetchCountryData() async {
//     final String _url = "http://disease.sh/v3/covid-19/countries";
//     Response response = await get(Uri.encodeFull(_url));

//     if (response.statusCode == 200) {
//       print(response.body);
//       CountryModel countryModell = CountryModel.fromJson(json.decode(response.body));
//       return countryModell;
//     }
//   }
}
