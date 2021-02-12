import 'package:airticket_app/common_properties/colors.dart';
import 'package:airticket_app/common_properties/strings.dart';
import 'package:airticket_app/components/Raised_button.dart';
import 'package:airticket_app/components/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Login_State();
  }
}

class Login_State extends State<LoginScreen> {
  bool _passwordvisible;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _passwordvisible = false;
  }

  /// method to validate the password
  String validatePassword(String value) {
    Pattern pattern =
    Strings.password_pattern;
    // r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = new RegExp(pattern);
    print(value);
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value))
        return 'Enter valid password';
      else
        return null;
    }
  }

  /// method to validate the email
  String validateEmail(String value) {
    Pattern pattern = Strings.email_pattern;


        // r'^(?=.*?[a-z])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = new RegExp(pattern);
    print(value);

    if (value.isEmpty) {
      return 'Please enter Email';
    } else {
      if (!regex.hasMatch(value))
        return 'Enter valid Email';
      else
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: Appbarwidget.getAppBar("login"),
      body: ListView(
        children: [
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /// Create account Text
                Container(
                  child: Text(
                    Strings.login,   // login
                    style: GoogleFonts.roboto(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors1.createAccountColor),
                  ),
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.19,
                  margin: const EdgeInsets.only(top: 30, right: 100),
                  // color: Colors.yellow,
                ),



                // /// Text Email
                // Container(
                //   child: ListTile(
                //     title: Text(
                //       Strings.email,
                //       style: TextStyle(
                //           fontSize: 18,
                //           fontWeight: FontWeight.bold,
                //           color: Colors.black54),
                //     ),
                //   ),
                //   margin: const EdgeInsets.only(left: 14),
                // ),

                /// Email validation TextField
                Container(
                  child: TextFormField(
                    validator: validateEmail,
                    //    controller: controller_email,
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.email,
                        color: Colors.pink,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black54),
                      ),
                      hintText: Strings.email,
                    ),
                  ),
                  margin: const EdgeInsets.only(left: 30, right: 30),
                ),

                SpacerClass(),
                SpacerClass(),
                SpacerClass(),

                // Container(
                //   child: ListTile(
                //     title: Text(
                //       Strings.Password ,
                //       style: TextStyle(
                //           fontSize: 18,
                //           fontWeight: FontWeight.bold,
                //           color: Colors.black54),
                //     ),
                //   ),
                //   margin: const EdgeInsets.only(left: 14),
                // ),

                /// option to hide and make visible the password using TextFormField
                Container(
                  child: TextFormField(
                    validator: validatePassword,
                    //   controller: controller_password,
                    keyboardType: TextInputType.text,
                    obscureText: !_passwordvisible,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      // hintText: 'Enter your password',
                      // Here is key idea
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordvisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black54,
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            _passwordvisible = !_passwordvisible;
                          });
                        },
                      ),
                    ),
                  ),
                  margin: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                ),

                SpacerClass(),
                SpacerClass(),

                /// custom Sign up Button coming from Button.dart
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Container(
                          height: 60,
                          width: 300,
                          // color: Colors.yellow,
                          child: MyButton(
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                // Navigator.of(context).push(
                                //   MaterialPageRoute(
                                //       builder: (context) => HomeScreen()),

                              }
                            },
                            title: (Strings.login ),
                          ),
                        ),
                      ),
                      /// google and facebook floating action button
                      Container(
                        child: Stack(
                          children: <Widget>[
                            Align(
                              alignment: Alignment(-0.3,0),
                              child: FloatingActionButton(
                                //  onPressed: make_call,
                                heroTag: "btn1",
                                child: Image.network("https://1000logos.net/wp-content/uploads/2016/11/Facebook-logo-500x350.png"),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.3,0),
                              child: FloatingActionButton(
                                //onPressed: send_email,
                                heroTag: "btn2",
                                child: Image.network("https://w7.pngwing.com/pngs/937/156/png-transparent-google-logo-google-search-google-account-redes-search-engine-optimization-text-service-thumbnail.png",width: 35,)
                              ),
                            ),
                          ],
                        ),
                        margin: const EdgeInsets.all(20),
                      ),
                    ],
                  ),
                ),

                /// Text sign in to navigate to next Screen
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Strings.Noaccount,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                          FlatButton(
                            child: Text(
                              Strings.SIGN_UP,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.pinkAccent,
                              ),
                            ),
                            onPressed: () {
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //       builder: (context) => RegistrationScreen()),
                              // );
                            },
                          ),
                        ],
                      ),
                      Container(
                        child: Text(
                          Strings.SKIP,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                        //    margin: const EdgeInsets.only(top: 10),
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.only(top: 80),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}