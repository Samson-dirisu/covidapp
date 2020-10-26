import 'package:covidapp/Utils/custom_color.dart';
import 'package:covidapp/screens/myth_buster_screen.dart';
import 'package:covidapp/screens/question_answer.dart';
import 'package:covidapp/screens/symtoms.dart';
import 'package:covidapp/screens/tip_screen.dart';
import 'package:flutter/material.dart';

class SecondCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          secondCategoryBlock(
                categoryColor: CustomColor.customYellow,
                categoryName: "SYMPTOMS",
                context: context,
                screen: Symtoms()),
            
           secondCategoryBlock(
                categoryColor: CustomColor.appBarBlue,
                categoryName: "Q & A",
                context: context,
                screen: QuestionAnswer()
                ),
            
          secondCategoryBlock(
              categoryColor: CustomColor.buttonColor,
              categoryName: "MYTH BUSTERS",
              context: context,
              screen: MythBusters()),
          secondCategoryBlock(
            categoryColor: CustomColor.customDarkBlue,
            categoryName: "TIPS",
            context: context,
            screen: TipScreen()
          ),
        ],
      ),
    );
  }

  Widget secondCategoryBlock(
      {String categoryName,
      Color categoryColor,
      BuildContext context,
      Widget screen}) {
    var width = MediaQuery.of(context).size.width;

    return GestureDetector(
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
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return screen;
        }));
      },
    );
  }
}
