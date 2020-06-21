import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'Icon_content.dart';
import 'constants.dart';
import 'results_page.dart';
import 'bottom_btton.dart';
import 'age_icon_button.dart';
import 'calculator_brain.dart';
enum Gender{
  male,
  female,
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;
  Gender selectedgender;
  int height = 180;
  int weight = 60;
  int age = 30;
  //1= male 2=female
  /*void updateColor( Gender gender){
    if(gender == Gender.male){
      if(maleCardColor == inactiveCardColor) {
        maleCardColor = colour;
        femaleCardColor = inactiveCardColor;
      }
      else
        maleCardColor = inactiveCardColor;
    }
    if(gender == Gender.female)
      {
        if(femaleCardColor == inactiveCardColor) {
          femaleCardColor = colour;
          maleCardColor = inactiveCardColor;
        }
        else
          femaleCardColor = inactiveCardColor;
      }
  }*/

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child:Row(
            children: <Widget>[
              Expanded(child: ReusableCard(
                onPress:(){
                  setState(() {
                    selectedgender=Gender.male;
                  });
                },
                col:selectedgender==Gender.male?kColour:kInactiveCardColor,
                card:ReusableCardColumn(data:'Male',sign:FontAwesomeIcons.mars),
              ),
              ),

              Expanded(child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedgender = Gender.female;
                    });
                  },
                  col:selectedgender==Gender.female?kColour:kInactiveCardColor,
                  card:ReusableCardColumn(data:'Female',sign:FontAwesomeIcons.venus)),
              ),
            ],
          ),
          ),



          Expanded(child:Row(
            children: <Widget>[
              Expanded(child:
              ReusableCard(col:kColour,
                card:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[Text(
                      'HEIGHT',style:kLabelTextStyle
                  ),
                    Row(
                      textBaseline:TextBaseline.alphabetic ,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,

                      children: <Widget>[
                        Text(
                          height.toString(),
                          style:kNumberstyle,
                        ),
                        Text(
                          'cm',
                          style:kNumberstyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data:SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        overlayColor: Color(0x29EB1555),
                        thumbColor: Color(0xFFEB1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min:120.0,
                        max:200,
                        onChanged:(double newValue){
                          setState(() {
                            height  = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
              ),
            ],
          ),
          ),
          Expanded(child:Row(
            children: <Widget>[
              Expanded(child: ReusableCard(col:kColour,
                card:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('WEIGHT',
                        style:kLabelTextStyle),
                    Text(weight.toString(),
                      style:kNumberstyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                          icon:FontAwesomeIcons.minus,
                          onPressed: (){
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                        SizedBox(
                          width:10.0,
                        ),
                        RoundIconButton(
                          icon:FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              ),
              Expanded(child:  ReusableCard(col:kColour,
                card:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Age',
                        style:kLabelTextStyle),
                    Text(age.toString(),
                      style:kNumberstyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundageButton(
                          icon:FontAwesomeIcons.minus,
                          onPressed: (){
                            setState(() {
                              age--;
                            });
                          },
                        ),
                        SizedBox(
                          width:10.0,
                        ),
                        RoundageButton(
                          icon:FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                              age++;
                            });
                          },
                        ),
                      ],
                    ),


                  ],
                ),
              ),
              ),
            ],
          ),
          ),


          BottomButton(buttonTitle:'CALCULATE',onTap:(){
            CalculatorBrain cal = CalculatorBrain(height:height,weight:weight);
            Navigator.push(context,MaterialPageRoute(builder:(context){
              return ResultsPage(
                bmiResult: cal.calculateBMI(),
                resultText:cal.getResult() ,
                interpretation: cal.getInterpretation(),
              );
            },),);
          },),
        ],
      ),
    );
  }
}








