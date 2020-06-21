import 'package:flutter/material.dart';
import 'constants.dart';


class ReusableCardColumn extends StatelessWidget {

  final IconData sign;
  final String data;
  ReusableCardColumn({this.data,this.sign});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
          Icon(
            sign,
            size:80.0,
          ),
          SizedBox(
            height:15.0,
          ),
          Text(
            data,
            style:kLabelTextStyle,
          )
        ]
    );
  }
}