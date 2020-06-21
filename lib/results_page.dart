import 'constants.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'bottom_btton.dart';
class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.bmiResult,@required this.interpretation,@required this.resultText});
  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('BMI Calculator'),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: <Widget>[
          Expanded(
            child:Container(
              padding: EdgeInsets.all(15.0),
              child:Text(
                'YOUR RESULT',
                style: kTitleTextStyle,
              ),
            ),

          ),
          Expanded(
            flex:5,
            child:ReusableCard(
              col:kColour,
              card:Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style:kresultTextStyle ,
                  ),
                  Text(
                    bmiResult,
                    style:kBMITextStyle,
                  ),
                  Text(
                    interpretation.toUpperCase(),
                    textAlign: TextAlign.center,
                    style:kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
              buttonTitle: 'Re-Calculate',
              onTap:(){
                Navigator.pop(context);
              }
          ),
        ],
      ),
    );
  }
}
