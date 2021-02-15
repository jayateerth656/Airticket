import 'package:airticket_app/common_properties/colors.dart';
import 'package:flutter/material.dart';

class MyFlat_button extends StatelessWidget {
  MyFlat_button({@required this.onPressed, @required this.title});

  final GestureTapCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors1. button_color,
      child: Container(
        // width: MediaQuery.of(context).size.width * 0.55,
        padding: EdgeInsets.all(6.0),
        child: Text(
          title,
          style: TextStyle(
              color: Colors1.white,
              fontSize: 10
          ),
          textAlign: TextAlign.center,
        ),
      ),
      onPressed: onPressed,
      // shape: const StadiumBorder(),
    );
  }
}






class Flatbttn extends StatelessWidget{
  Flatbttn({@required this.onPressed,@required this.title});
  final GestureTapCallback onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FlatButton(
      child: Text(
        title,
        style: TextStyle(color: Colors1. textcolors1, fontSize: 15),
        textAlign: TextAlign.center,
      ),
      onPressed: onPressed,
    );
  }
}