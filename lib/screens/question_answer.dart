import 'package:covidapp/Utils/custom_color.dart';
import 'package:covidapp/models/question_model.dart';
import 'package:flutter/material.dart';

class QuestionAnswer extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "QUESTIONS AND ANSWERS",
          style: TextStyle(
            color: CustomColor.backgroundColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: CustomColor.appBarBlue,
      ),
      backgroundColor: CustomColor.backgroundColor,
      body: ListView.builder(
        itemCount: QuestionAnswerModel.qustionAnswerModel.length,
        itemBuilder: (context, index) {
        return ExpansionTile(
          title: Text(QuestionAnswerModel.qustionAnswerModel[index]["Question"]),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(QuestionAnswerModel.qustionAnswerModel[index]["Answer"],
              style: TextStyle(
                fontSize: 18.0
              ),
              ),
            )
          ],
        );
      }),
    );
  }
}
