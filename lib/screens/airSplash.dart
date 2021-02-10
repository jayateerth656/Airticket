import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class A_splashscreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();
    return SplashState();
  }
}

class SplashState extends State<A_splashscreen> {
  // void initState() {
  //   super.initState();
  //   Timer(Duration(seconds: 5),
  //         ()=>Navigator.pushReplacement(context,
  //         MaterialPageRoute(builder:
  //             (context) =>
  //         null,
  //         )
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;             //to set default height and width
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: HexColor('#000099'),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: width * 0.20,
              child: Image.asset('assets/images/Splash_Logo.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 130),
              child: Container(
                width: width * 0.52,
                child: Image.asset(
                  'assets/images/Logo_name.png',
                  scale: 0.80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


























// import 'dart:async';


















// import 'package:flutter/material.dart';
// class Air_splash extends StatefulWidget {
//   @override
//   _Air_splashState createState() => _Air_splashState();
// }
//
// class _Air_splashState extends State<Air_splash> {
//   @override
//
//   void initState(){
//     super.initState();
//     Timer(Duration(seconds: 6), () {  });
//   }
//   @override
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: ,
//       ),
//
//
//         color: Colors.deepPurple[900],
//         child:Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("navana air")
//           ],
//
//
//
//         )
//         // padding: EdgeInsets.fromLTRB(60, 60, 40, 60),
//         // child: Text("navana air",textAlign: TextAlign.center,),
//
//
//         // padding: EdgeInsets.all(20),
//         // child: Text("navana air",style: TextStyle(backgroundColor: Colors.black,fontSize:10,fontWeight:FontWeight.normal ),),
//
//       );
//
//   }
// }
