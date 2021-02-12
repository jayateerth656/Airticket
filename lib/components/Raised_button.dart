

import 'package:airticket_app/common_properties/colors.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({@required this.onPressed, @required this.title,});

  final GestureTapCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors1.button_color,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.55,
        padding: EdgeInsets.all(8.0),
        child: Text(
          title,
          style: TextStyle(
              color: Colors1.textcolors,
              fontSize: 18
          ),
          textAlign: TextAlign.center,
        ),
      ),
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }
}

