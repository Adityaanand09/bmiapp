import 'dart:math';
class CalculatorBrain{
  CalculatorBrain({this.height,this.weight});
  final int height;
  final int weight;
  double _BMI;

  String calculateBMI(){
    _BMI = weight/pow(height/100,2);
    return _BMI.toStringAsFixed(1);
  }

  String getResult()
  {
    if(_BMI>=25)
      return 'OVERWEIGHT';
    else if(_BMI>18.5)
      return 'NORMAL';
    else
      return 'UNDERWEIGHT';
  }
  String getInterpretation(){
    if(_BMI>=25)
      return 'You have a higher than normal weight.Try to exercise more!';
    else if(_BMI>18.5)
      return 'You have a normal body weihgt.Good job!';
    else
      return 'You have a lower than normal body weight.Eat a bit more!';
  }
}