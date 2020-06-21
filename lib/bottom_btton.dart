import 'package:flutter/material.dart';
import 'constants.dart';
class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap,@required this.buttonTitle});
  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color:kBottomContainerColor,
        margin:EdgeInsets.only(top:10.0),
        width:double.infinity,
        height:kbottomContainerHeight,
        padding:EdgeInsets.only(bottom:20.0),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              buttonTitle,
              style:klabelcalTextStyle,
            ),

          ],
        ),
      ),
    );
  }
}