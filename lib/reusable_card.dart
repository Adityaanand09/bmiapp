import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {



  ReusableCard({@required this.col, this.card,this.onPress});
  final Color col;
  final Widget card;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      child: Container(
        child:card,
        margin:EdgeInsets.all(15.0),
        decoration:BoxDecoration(
          color:col,
          borderRadius:BorderRadius.circular(10.0),
        ),
      ),
      onTap: onPress,
    );
  }
}