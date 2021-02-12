

import 'package:airticket_app/common_properties/colors.dart';
import 'package:airticket_app/common_properties/strings.dart';
import 'package:airticket_app/components/Flatbutton.dart';
import 'package:airticket_app/components/Raised_button.dart';
import 'package:airticket_app/components/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';




class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String username, email, _password = "";
  final _formKey = GlobalKey<FormState>();
  FocusNode _usernameFocusNode = FocusNode();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  bool _isHidden = true;

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 80.0, bottom: 20.0, left: 20.0, right: 20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Create',
                            style: GoogleFonts.spartan(
                                color: Colors1.createAccountColor,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'an account',
                            style: GoogleFonts.spartan(
                                color:Colors1.createAccountColor,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SpacerClass(),
                      Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.name,
                            validator: (name) {
                              Pattern pattern =
                                  r'^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$';
                              RegExp regex = new RegExp(pattern);
                              if (!regex.hasMatch(name))
                                return 'Invalid username';
                              else
                                return null;
                            },
                            onSaved: (name) => username = name,
                            onFieldSubmitted: (_) {
                              fieldFocusChange(
                                  context, _usernameFocusNode, _emailFocusNode);
                            },
                            onChanged: (value) {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                              }
                            },
                            decoration: InputDecoration(
                                hintText: 'Name',
                                labelText: 'Name',
                                labelStyle: TextStyle(
                                    color: Colors1. mailIconColor,
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            focusNode: _emailFocusNode,
                            keyboardType: TextInputType.emailAddress,
                            validator: (email) {
                              Pattern pattern =
                                  r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                  r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                  r"{0,253}[a-zA-Z0-9])?)*$";
                              RegExp regex = new RegExp(pattern);
                              if (!regex.hasMatch(email))
                                return 'Invalid Email';
                              else
                                return null;
                            },
                            onSaved: (email) => email = email,
                            onFieldSubmitted: (_) {
                              fieldFocusChange(
                                  context, _emailFocusNode, _passwordFocusNode);
                            },
                            onChanged: (value) {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                              }
                            },
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                  color: Colors1. mailIconColor,
                                  fontWeight: FontWeight.bold),

                              suffixIcon: InkWell(
                                  child: Icon(
                                    Icons.email,
                                    color: Colors1.mailIconColor,
                                  )

                                // errorText: wrongPassword ? passwordText : null,

                              ),

                              // errorText: wrongEmail ? emailText : null,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            obscureText: _isHidden,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (password) {
                              Pattern pattern =
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                              RegExp regex = new RegExp(pattern);
                              if (!regex.hasMatch(password))
                                return 'Invalid password';
                              else
                                return null;
                            },
                            onSaved: (password) => _password = password,
                            onChanged: (password) {
                              // password = value;
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                              }
                            },
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                  // color: CustomizedColors.emailtitle,
                                  fontWeight: FontWeight.bold),
                              suffixIcon: InkWell(
                                  onTap: () {
                                    _togglePasswordView();
                                  },
                                  child: Icon(
                                    _isHidden
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    // color: CustomizedColors.emailtitle,
                                  )

                                // errorText: wrongPassword ? passwordText : null,

                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                        ],
                      ),
                      SpacerClass(),
                      SpacerClass(),
                      MyButton(
                        onPressed: () {},
                        title: Strings.SIGN_UP,
                      ),
                      SpacerClass(),
                      SpacerClass(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(
                                fontSize: 16.0,
                                // color: CustomizedColor.emailtitle,
                                fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.pushNamed(context, id);
                            },
                            child: Text(
                              ' Sign In',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  // color: CustomizedColors.titlepinkcolor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SpacerClass(),
                      Container(
                        padding: EdgeInsets.only(
                            top: 0.0, bottom: 40.0, left: 20.0, right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Skip for Now',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  // color: CustomizedColors.emailtitle,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      // ),
    );
  }
}

class _username {
}

String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Enter Valid Email';
  else
    return null;
}

void fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}






































// class SignUp extends StatefulWidget {
// @override
// _SignUpState createState() => _SignUpState();
// }
//
//
// class _SignUpState extends State<SignUp> {
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//           body: Container(
//             padding: const EdgeInsets.only(left: 25, right: 25),
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//
//             child: ListView(
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     SpacerClass(),
//                     SpacerClass(),
//                     SpacerClass(),
//                     Row(
//                       children: [
//                         Container(
//                           child: Text(Strings.create_account, style: TextStyle(
//                               color: Colors1.createAccountColor,
//                               fontSize: 40,
//                               fontWeight: FontWeight.bold
//                           ),
//                           ),
//                           padding: const EdgeInsets.only(bottom: 15),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Container(
//                           child:  TextField(
//                             decoration: InputDecoration(
//                               labelText: "Name",
//                             ),
//                           ),
//                           width: 340,
//                           padding: const EdgeInsets.only(top: 5.0, bottom: 5),
//                         ),
//                       ],
//                     ),
//                     Row(
//
//                       children: [
//                         Container(
//                           child:  TextField(
//                             decoration: InputDecoration(
//                               labelText: "Email",
//                               suffixIcon: InkWell(
//                                 child: Icon(
//                                   Icons.mail,
//                                   color: Colors1. mailIconColor,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           width: 340,
//                           padding: const EdgeInsets.only(top: 5.0, bottom: 5),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Container(
//                           child: TextField(
//
//                             obscureText: true,
//                             decoration: InputDecoration(
//                               labelText: 'Password',
//                               suffixIcon: InkWell(
//                                 child: Icon(
//                                     Icons.visibility_off
//                                 ),
//                               ),
//                             ),
//                           ),
//                           width: 340,
//                           padding: const EdgeInsets.only(top: 5.0, bottom: 5),
//                         ),
//                       ],
//                     ),
//                     SpacerClass(),
//                     SpacerClass(),
//                     MyButton(
//                       onPressed: (){},
//                       title: Strings.SIGN_UP,
//                     ),
//                     SpacerClass(),
//                     SpacerClass(),
//                     SpacerClass(),
//                     SpacerClass(),
//                     SpacerClass(),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(Strings.If_exist,
//                           style: TextStyle(
//                               color: Colors1.haveAccountColor,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16
//                           ),
//                         ),
//                         FlatButton(
//                           onPressed: () {  },
//                           child: Text(Strings.SIGN_IN,
//                             style: TextStyle(
//                                 color: Colors1.textSignInColor,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         FlatButton(
//                             onPressed: () {  },
//                             child: Container(
//                               padding: const EdgeInsets.only(bottom: 30),
//                               child: Text(Strings.SKIP,
//                                 style: TextStyle(
//                                     color: Colors1.skipNowColor,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 16
//                                 ),
//                               ),
//                             ))
//                       ],
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         )
//     );
//   }
// }

















// class SignUp extends StatefulWidget {
//   @override
//   _SignUpState createstate() => _SignUpState();
//
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     // throw UnimplementedError();
//     return _SignUpState();
//   }
// }
//
// class _SignUpState extends State<SignUp> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: [
//           // Align(
//           //   alignment: Alignment.topRight,
//           //   child: Image.asset('assets/images/background.png'),
//           // ),
//           Padding(
//             padding: EdgeInsets.only(
//                 top: 60.0, bottom: 20.0, left: 20.0, right: 20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   '',
//                   style: TextStyle(fontSize: 50.0),
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       Strings.create_account,
//                       style: TextStyle(fontSize: 30.0),
//                     ),
//                     Text(
//                         Strings.create_accountsub,
//
//                       style: TextStyle(fontSize: 30.0),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     TextField(
//                       keyboardType: TextInputType.name,
//                       // onChanged: (value) {
//                       //   var name = value;
//                       // },
//                       decoration: InputDecoration(
//                         // hintText: 'Full Name',
//                         labelText: 'Full Name',
//                       ),
//                     ),
//                     SpacerClass(),
//                     SpacerClass(),
//                     TextField(
//                       keyboardType: TextInputType.emailAddress,
//                       // onChanged: (value) {
//                       //   // email = value;
//                       // },
//                       decoration: InputDecoration(
//                         labelText: 'Email',
//                         // errorText: wrongEmail ? emailText : null,
//                       ),
//                     ),
//                     SpacerClass(),
//                     SpacerClass(),
//                     TextField(
//                       obscureText: true,
//                       keyboardType: TextInputType.visiblePassword,
//                       // onChanged: (value) {
//                       //   // password = value;
//                       // },
//                       decoration: InputDecoration(
//                         labelText: 'Password',
//                         // errorText: wrongPassword ? passwordText : null,
//                       ),
//                     ),
//                     SpacerClass(),
//                   ],
//                 ),
//                 // RaisedButton(
//                 //   padding: EdgeInsets.symmetric(vertical: 10.0),
//                 //   // color: Color(0xff447def),
//                 //   onPressed: () async {
//                 //     // setState(() {
//                 //     //   _wrongEmail = false;
//                 //     //   _wrongPassword = false;
//                 //     // });
//                 //     // try {
//                 //     //   if (validator.isEmail(email) &
//                 //     //       validator.isLength(password, 6)) {
//                 //     //     setState(() {
//                 //     //       _showSpinner = true;
//                 //     //     });
//                 //     //     final newUser =
//                 //     //         await _auth.createUserWithEmailAndPassword(
//                 //     //       email: email,
//                 //     //       password: password,
//                 //     //     );
//                 //     //     if (newUser != null) {
//                 //     //       print('user authenticated by registration');
//                 //     //       // Navigator.pushNamed(context, Done.id);
//                 //     //     }
//                 //     //   }
//                 //
//                 //     //   setState(() {
//                 //     //     if (!validator.isEmail(email)) {
//                 //     //       _wrongEmail = true;
//                 //     //     } else if (!validator.isLength(password, 6)) {
//                 //     //       _wrongPassword = true;
//                 //     //     } else {
//                 //     //       _wrongEmail = true;
//                 //     //       _wrongPassword = true;
//                 //     //     }
//                 //     //   });
//                 //     // } catch (e) {
//                 //     //   setState(() {
//                 //     //     _wrongEmail = true;
//                 //     //     if (e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
//                 //     //       _emailText =
//                 //     //           'The email address is already in use by another account';
//                 //     //     }
//                 //     //   });
//                 //     // }
//                 //   },
//                 //   child: Text(
//                 //       Strings.SIGN_UP,
//                 //     style: TextStyle(fontSize: 25.0, color: Colors1.textcolors),
//                 //   ),
//                 // ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 10.0),
//                       child: Container(
//                         height: 1.0,
//                         width: 60.0,
//                         // color: Colors.black87,
//                       ),
//                     ),
//                     // Text(
//                     //   'Or',
//                     //   style: TextStyle(fontSize: 25.0),
//                     // ),
//                     Padding(
//                       padding: EdgeInsets.all(12),
//                       child: Center(
//                         child: Container(
//
//
//                           child:  MyButton(
//                             //calling raised button from re-usable components
//                             onPressed: () {},
//                             title: Strings.SIGN_UP, //calling string from common properties
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                 Strings.If_exist,
//                       style: TextStyle(fontSize: 16.0),
//                     ),
//
//
//
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       // ),
//     );
//   }
// }