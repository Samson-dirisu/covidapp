import 'package:covidapp/Utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdateCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        height: 150,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
             categoryBlock(
                  categoryName: "News",
                  categoryColor: CustomColor.customDarkBlue,
                  context: context,
                  url: "https://www.worldometers.info/coronavirus/"),
            categoryBlock(
                categoryName: "NCDC UPDATE",
                categoryColor: CustomColor.buttonColor,
                context: context,
                url: "https://covid19.ncdc.gov.ng"),
            categoryBlock(
                categoryName: "VAC UPDATE",
                categoryColor: CustomColor.appBarBlue,
                context: context,
                url: "https://www.nytimes.com/interactive/2020/science/coronavirus-vaccine-tracker.html" ),
            categoryBlock(
                categoryName: "W.H.O",
                categoryColor: CustomColor.customYellow,
                context: context,
                url: "https://www.who.int/health-topics/coronavirus#tab=tab_1"),
          ],
        ),
      ),
    );
  }

  Widget categoryBlock(
      {String categoryName, Color categoryColor, BuildContext context, 
      String url}) {
    var width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: (){
        launch(url);
      },
          child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          alignment: Alignment.center,
          width: width / 3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: categoryColor,
          ),
          child: Text(
            categoryName,
            style: TextStyle(
                color: CustomColor.backgroundColor,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
