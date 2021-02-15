
import 'package:airticket_app/common_properties/colors.dart';
import 'package:airticket_app/common_properties/strings.dart';
import 'package:airticket_app/components/Flatbutton.dart';
import 'package:airticket_app/components/Raised_button.dart';
import 'package:airticket_app/screens/sign_up.dart';
import 'package:airticket_app/services/login_auth.dart';

import 'package:flutter/material.dart';

import 'homepage.dart';
class Login_page extends StatefulWidget{
@override
State<StatefulWidget> createState() {
  // TODO: implement createState
  return Login_screen();
}
}
class Login_screen extends State<Login_page>{
  bool _isHidden=true;
  String email;
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  //TextEditingController password = TextEditingController();  //TextController to read text entered in text field
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child:Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top:90),
                        child: ListTile(
                          title: Text(
                            Strings.login,
                            style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,
                                color: Colors1.createAccountColor),//By using class name and object to show the color here.
                            
                          ),
                        ) ,
                      ),
                      Container(
                        child: TextFormField(
                          validator: validateEmail,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.done,color: Colors1.createAccountColor ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color:Colors.black54),
                            ),
                            hintText: Strings.email,
                          ),
                        ),
                        margin: const EdgeInsets.only(left: 30,right: 30,top: 30),
                      ),
                      Container(
                        child:TextFormField(
                          validator: validatePassword,
                          obscureText: _isHidden,
                          decoration: InputDecoration(
                            hintText: Strings.Password,
                            suffix: InkWell(
                              onTap: _togglePasswordView,
                              child: Icon(
                                _isHidden ? Icons.visibility : Icons.visibility_off,
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color:Colors.black54),
                            ),
                          ),
                        ),
                        margin: const EdgeInsets.only(left: 30,right: 30,top: 30),
                      ),


                      Padding(
                        padding: const EdgeInsets.only(top: 60),
                        child: Container(
                          margin: EdgeInsets.only(left: 10,right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyButton(onPressed: (){
                                // Validate returns true if the form is valid, otherwise false.
                                if (_formKey.currentState.validate()) {
                                  // print("successful");
                                  // If the form is valid, display a snackbar. In the real world,
                                  // you'd often call a server or save the information in a database.
                                  // Scaffold
                                  //     .of(context)
                                  //     .showSnackBar(SnackBar(content: Text('Processing Data')));
                                }else{
                                  //print("Unsuccessful");
                                }
                              },
                                title:Strings. login,//Login button text
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Text(
                              '- OR -',
                              style: TextStyle(color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                        Container(
                          padding: const EdgeInsets.only(left: 70),
                        child: Row(
                          children: [
                            Text(Strings.login_with,
                              style:TextStyle(fontSize: 18),
                            ),
                            // Container(
                            //   padding: const EdgeInsets.only(left: 40),
                            //   height: 60.0,
                            //   width: 60.0,
                            //   decoration: BoxDecoration(
                            //     shape: BoxShape.circle,
                            //     color: Colors.white,
                            //     boxShadow: [
                            //       BoxShadow(
                            //         color: Colors.black26,
                            //         offset: Offset(0, 2),
                            //         blurRadius: 6.0,
                            //       ),
                            //     ],
                            //     image: DecorationImage(
                            //       image:new AssetImage(""),
                            //     ),
                            //   ),
                            // ),
                            // Container(
                            //   padding: const EdgeInsets.only(left: 20),
                            //   child: FloatingActionButton(
                            //     heroTag: "fb button",
                            //     onPressed:(){},
                            //    // child: Image.network(ImageList.fb_image),
                            //   ),
                            // ),
                            Container(
                              padding: const EdgeInsets.only(left: 20),
                              child: FloatingActionButton(
                                heroTag: "fb button",
                                onPressed:(){},
                                child: Image.network("https://1000logos.net/wp-content/uploads/2016/11/Facebook-logo-500x350.png"),
                                backgroundColor:Colors.white,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 20),
                              child: FloatingActionButton(
                                heroTag: "google button",
                                onPressed:(){
                                  signInWithGoogle().whenComplete(() {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                        return Homepage ();
                                      }
                                      ),);
                                  });





                                  // signInWithGoogle().whenComplete(() {
                                  //   Navigator.of(context).push(
                                  //     MaterialPageRoute(builder: (context) {
                                  //       return Sign_up();
                                  //     }
                                  //     ),);
                                  // });

                                },
                                child: Image.network("https://w7.pngwing.com/pngs/937/156/png-transparent-google-logo-google-search-google-account-redes-search-engine-optimization-text-service-thumbnail.png",),
                                backgroundColor: Colors.white,
                              ),
                            ),
                          ],

                        ),
                      

                        ),
                        

                        






                      Padding(
                        padding: const EdgeInsets.all(10),
                        child:Container(
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                Text(Strings. Noaccount),  //here we add text by call the class and object name to display text.
                                // margin: EdgeInsets.only(left: 20),
                             Flatbttn(
                                 onPressed: () {  }, title: Strings.SIGN_UP,
                                
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                            Strings.SKIP),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}













































































// import 'package:airticket_app/common_properties/colors.dart';
// import 'package:airticket_app/common_properties/strings.dart';
// import 'package:airticket_app/components/Raised_button.dart';
// import 'package:airticket_app/components/sizedbox.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// class LoginScreen extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return Login_State();
//   }
// }

// class Login_State extends State<LoginScreen> {
//   bool _passwordvisible;
//   final _formKey = GlobalKey<FormState>();

//   @override
//   void initState() {
//     _passwordvisible = false;
//   }

//   /// method to validate the password
//   String validatePassword(String value) {
//     Pattern pattern =
//     Strings.password_pattern;
//     // r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
//     RegExp regex = new RegExp(pattern);
//     print(value);
//     if (value.isEmpty) {
//       return 'Please enter password';
//     } else {
//       if (!regex.hasMatch(value))
//         return 'Enter valid password';
//       else
//         return null;
//     }
//   }

//   /// method to validate the email
//   String validateEmail(String value) {
//     Pattern pattern = Strings.email_pattern;


//         // r'^(?=.*?[a-z])(?=.*?[!@#\$&*~]).{8,}$';
//     RegExp regex = new RegExp(pattern);
//     print(value);

//     if (value.isEmpty) {
//       return 'Please enter Email';
//     } else {
//       if (!regex.hasMatch(value))
//         return 'Enter valid Email';
//       else
//         return null;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: Appbarwidget.getAppBar("login"),
//       body: ListView(
//         children: [
//           Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 /// Create account Text
//                 Container(
//                   child: Text(
//                     Strings.login,   // login
//                     style: GoogleFonts.roboto(
//                         fontSize: 35,
//                         fontWeight: FontWeight.bold,
//                         color: Colors1.createAccountColor),
//                   ),
//                   width: MediaQuery.of(context).size.width * 0.6,
//                   height: MediaQuery.of(context).size.height * 0.19,
//                   margin: const EdgeInsets.only(top: 30, right: 100),
//                   // color: Colors.yellow,
//                 ),



//                 // /// Text Email
//                 // Container(
//                 //   child: ListTile(
//                 //     title: Text(
//                 //       Strings.email,
//                 //       style: TextStyle(
//                 //           fontSize: 18,
//                 //           fontWeight: FontWeight.bold,
//                 //           color: Colors.black54),
//                 //     ),
//                 //   ),
//                 //   margin: const EdgeInsets.only(left: 14),
//                 // ),

//                 /// Email validation TextField
//                 Container(
//                   child: TextFormField(
//                     validator: validateEmail,
//                     //    controller: controller_email,
//                     decoration: InputDecoration(
//                       suffixIcon: Icon(
//                         Icons.email,
//                         color: Colors.pink,
//                       ),
//                       enabledBorder: UnderlineInputBorder(
//                         borderSide: BorderSide(color: Colors.black54),
//                       ),
//                       hintText: Strings.email,
//                     ),
//                   ),
//                   margin: const EdgeInsets.only(left: 30, right: 30),
//                 ),

//                 SpacerClass(),
//                 SpacerClass(),
//                 SpacerClass(),

//                 // Container(
//                 //   child: ListTile(
//                 //     title: Text(
//                 //       Strings.Password ,
//                 //       style: TextStyle(
//                 //           fontSize: 18,
//                 //           fontWeight: FontWeight.bold,
//                 //           color: Colors.black54),
//                 //     ),
//                 //   ),
//                 //   margin: const EdgeInsets.only(left: 14),
//                 // ),

//                 /// option to hide and make visible the password using TextFormField
//                 Container(
//                   child: TextFormField(
//                     validator: validatePassword,
//                     //   controller: controller_password,
//                     keyboardType: TextInputType.text,
//                     obscureText: !_passwordvisible,
//                     decoration: InputDecoration(
//                       labelText: 'Password',
//                       // hintText: 'Enter your password',
//                       // Here is key idea
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           _passwordvisible
//                               ? Icons.visibility
//                               : Icons.visibility_off,
//                           color: Colors.black54,
//                         ),
//                         onPressed: () {
//                           // Update the state i.e. toogle the state of passwordVisible variable
//                           setState(() {
//                             _passwordvisible = !_passwordvisible;
//                           });
//                         },
//                       ),
//                     ),
//                   ),
//                   margin: const EdgeInsets.only(
//                     left: 30,
//                     right: 30,
//                   ),
//                 ),

//                 SpacerClass(),
//                 SpacerClass(),

//                 /// custom Sign up Button coming from Button.dart
//                 Container(
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(top: 40),
//                         child: Container(
//                           height: 60,
//                           width: 300,
//                           // color: Colors.yellow,
//                           child: MyButton(
//                             onPressed: () {
//                               if (_formKey.currentState.validate()) {
//                                 // Navigator.of(context).push(
//                                 //   MaterialPageRoute(
//                                 //       builder: (context) => HomeScreen()),

//                               }
//                             },
//                             title: (Strings.login ),
//                           ),
//                         ),
//                       ),

//                     Padding(
//                       padding: const EdgeInsets.only(left: 20),
//                       child: Row(children: [
//                         Text("login"),
//                         Container(
//                           child: FloatingActionButton(
//                                 //  onPressed: make_call,
//                                 heroTag: "btn1",
//                                 child: Image.network("https://1000logos.net/wp-content/uploads/2016/11/Facebook-logo-500x350.png"),
//                               ),
//                         ),
//                         Container(
//                           child: FloatingActionButton(
//                                 //  onPressed: make_call,
//                                 heroTag: "btn2",
//                                 child: Image.network("https://w7.pngwing.com/pngs/937/156/png-transparent-google-logo-google-search-google-account-redes-search-engine-optimization-text-service-thumbnail.png",width: 35,"),
//                               ),
//                             ),
                           
                              
//                           ],
//                         ),
//                       ),
//                       ],)
//                     ),



//                       /// google and facebook floating action button
                      
//                     ],
//                   ),
//                 ),

//                 /// Text sign in to navigate to next Screen
//                 Container(
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             Strings.Noaccount,
//                             style: TextStyle(
//                               fontSize: 17,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black54,
//                             ),
//                           ),
//                           FlatButton(
//                             child: Text(
//                               Strings.SIGN_UP,
//                               style: TextStyle(
//                                 fontSize: 17,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.pinkAccent,
//                               ),
//                             ),
//                             onPressed: () {
//                               // Navigator.of(context).push(
//                               //   MaterialPageRoute(
//                               //       builder: (context) => RegistrationScreen()),
//                               // );
//                             },
//                           ),
//                         ],
//                       ),
//                       Container(
//                         child: Text(
//                           Strings.SKIP,
//                           style: TextStyle(
//                             fontSize: 17,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black54,
//                           ),
//                         ),
//                         //    margin: const EdgeInsets.only(top: 10),
//                       ),
//                     ],
//                   ),
//                   margin: const EdgeInsets.only(top: 80),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }