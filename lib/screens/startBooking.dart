import 'package:airticket_app/common_properties/colors.dart';
import 'package:airticket_app/common_properties/strings.dart';
import 'package:airticket_app/components/Raised_button.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Start_booking extends StatefulWidget {
  //because we are passing index in set state method
  Start_booking() : super();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Start_bookingstate();
  }

// final String title = "Carousel Demo";

// @override
// StateStart_booking() =>  Start_booking();
//
// @override
// State<StatefulWidget> createState() {
//   // TODO: implement createState
//   // throw UnimplementedError();
// }
}

class Start_bookingstate extends State<Start_booking> {
  //
  CarouselSlider carouselSlider;
  int _current = 0;
  List imgList = [
    // getting images from string file (common properties)
    Strings.image1,
    Strings.image2,
    Strings.image3,
    // 'https://image.shutterstock.com/z/stock-vector-woman-travel-alone-character-cartoon-of-woman-travel-woman-and-suitcase-abstract-nature-border-1424820401.jpg',
    // 'https://c8.alamy.com/comp/M6P8GW/cartoon-character-design-female-travel-with-luggage-and-passport-on-M6P8GW.jpg',
    // 'https://st4.depositphotos.com/34034756/38902/v/950/depositphotos_389023924-stock-illustration-woman-man-suitcase-awaits-boarding.jpg',
    // // 'https://images.unsplash.com/photo-1543922596-b3bbaba80649?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    // // 'https://images.unsplash.com/photo-1502943693086-33b5b1cfdf2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80'
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context)
        .size
        .height; //setting height and width by media query
    final width = MediaQuery.of(context).size.width;

    Widget _changeMode(
        {double sliderHt, double sliderWt, double buttonHt, double buttonwt}) {
      return Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FractionallySizedBox(
              child: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  carouselSlider = CarouselSlider(
                    //creating slider
                    height: sliderHt,
                    initialPage: 0,
                    enlargeCenterPage: true,
                    autoPlay: false,
                    reverse: false,
                    enableInfiniteScroll: true,
                    autoPlayInterval: Duration(seconds: 2),
                    autoPlayAnimationDuration: Duration(milliseconds: 2000),
                    pauseAutoPlayOnTouch: Duration(seconds: 10),
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index) {
                      setState(() {
                        //passing index of slides
                        _current = index;
                      });
                    },
                    items: imgList.map((imgUrl) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: sliderWt,
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                              // color: Colors.green,
                            ),
                            child: Image.network(
                              imgUrl,
                              fit: BoxFit.fill,
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: map<Widget>(imgList, (index, url) {
                      return Container(
                        width: 10.0,
                        height: 10.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == index
                              ? Colors1.pinkColor

                              : Colors1.greyColor,
                        ),
                      );
                    }),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 0,
                    ),
                    child: Container(
                      height: buttonHt,
                      width: buttonwt,
                      // color: Colors.yellow,
                      child: MyButton(
                        //calling raised button from re-usable components
                        onPressed: () {},
                        title: Strings
                            .BOOk_BUTTON, //calling string from common properties
                      ),
                    ),
                    // child: RaisedButton(
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.all(Radius.circular(80))),
                    //   onPressed: () {},
                    //   child: Text(
                    //     Strings.BOOk_BUTTON,                                         //calling text from class
                    //     style: TextStyle(fontSize: 20, color: Colors1.textcolors),    // calling colour
                    //     // style: GoogleFonts.spartan(
                    //     //     textStyle: Theme.of(context).textTheme.display1,fontSize: 20),
                    //   ),
                    //   color: Colors.pink[300],
                    // ),
                  )
                ]),
          ))
        ],
      );
    }

    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return _changeMode(
                sliderHt: height * 0.59,
                sliderWt: width  * 0.60,
                buttonHt: height * 0.08,
                buttonwt: width * 0.70);
          } else {
            return _changeMode(
                sliderHt: height * 0.60,
                sliderWt: width * 0.40,
                buttonHt: width * 0.05,
                buttonwt: height * 0.60);
          }
        },
      ),
      // body:
    );
  }
}
