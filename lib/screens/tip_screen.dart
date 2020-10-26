import 'package:covidapp/Utils/custom_color.dart';
import 'package:covidapp/models/tips_model.dart';
import 'package:flutter/material.dart';

class TipScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TIPS",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: CustomColor.appBarBlue,
      ),
      backgroundColor: CustomColor.appBarBlue,
      body: ListView(
        children: [
        Column(children: [
          covidImage(context, imageFile: "images/covidmain.png"),
          tipContainer(context: context)
        ]),
      ]),
    );
  }

  Widget covidImage(BuildContext context, {String imageFile}) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
        padding: EdgeInsets.all(10.0),
        height: height / 4,
        width: width,
        child: Image(
          image: AssetImage(imageFile),
          fit: BoxFit.cover,
        ));
  }

  Widget tipContainer({BuildContext context, String tip, String image}) {
    var width = MediaQuery.of(context).size.width;
    return Container(
        width: width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.0),
              topRight: Radius.circular(50.0),
            )),
        child: listOfTips());
  }

  Widget listOfTips() {
    TipsModel tipsModell = TipsModel();
    List tips = tipsModell.tipsModel;
    return ListView.builder(
         physics: NeverScrollableScrollPhysics(),
         shrinkWrap: true,
        itemCount: tips.length,
        itemBuilder: (context, index) {
          var height = MediaQuery.of(context).size.height;
          var width = MediaQuery.of(context).size.width;
          return Padding(
            padding: const EdgeInsets.only(bottom:50.0,),
            child: Container(
              decoration: BoxDecoration(
                color: CustomColor.backgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0)
                )
              ),
              
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
                      height: height / 3 ,
                      width: width / 3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                            image: AssetImage("${tips[index]["image"]}"),
                            fit: BoxFit.cover),
                      )),   
                  Container(
                    width: width / 2,
                    margin: EdgeInsets.symmetric(vertical: 40.0, horizontal: 10.0),
                    alignment: Alignment.topCenter,
                    child: Text(
                      "${tips[index]["tip"]}",
                      style: TextStyle(
                          color: CustomColor.appBarBlue,
                          fontWeight: FontWeight.bold,
                          wordSpacing: 8.0),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
