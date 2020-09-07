import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Josefin Sans',
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Mylogin(),
        ),
      )
    );
  }
}

class Mylogin extends StatefulWidget {
  @override
  _MyloginState createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {

  int _pageState = 0;

  var _backgroundColor = Colors.white;
  var _headingColor = Color(0XFFB66bfbf);

  double _headingTop = 100;

  double _loginWidth = 0;
  double _loginHeight = 0;
  double _loginOpacity = 1;

  double _loginYOffset = 0;
  double _loginXOffset = 0;
  double _registerYOffset = 0;
  double _registerHeight = 0;

  double windowWidth = 0;
  double windowHeight = 0;

  bool _keyboardVisible = false;

  @protected
  void initState() {
    super.initState();

    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          _keyboardVisible = visible;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;
    _loginHeight = windowHeight - 225;
    _registerHeight = windowHeight - 230;

    switch(_pageState){

      case 0:
        _backgroundColor = Colors.white;
        _headingColor = Color(0XFFB056674);

        _loginYOffset = windowHeight;
        _registerYOffset = windowHeight;

        _loginXOffset = 0;
        _loginWidth = windowWidth;

        _loginOpacity = 1;
        _headingTop = 100;
        break;
      case 1:
        _backgroundColor = Color(0XFFB66bfbf);
        _headingColor = Colors.white;

        _loginYOffset = _keyboardVisible ? 20 :225;
        _registerYOffset = windowHeight;

        _loginXOffset = 0;
        _loginWidth = windowWidth;

        _loginOpacity = 1;
        _headingTop = 90;
        break;
      case 2:
        _backgroundColor = Color(0XFFB66bfbf);
        _headingColor = Colors.white;

        _loginYOffset = 210;
        _registerYOffset = 230;

        _loginXOffset = 18;
        _loginWidth = windowWidth - 36;

        _loginOpacity = 0.7;
        _headingTop = 80;
        break;

    }
    return Stack(
      children: [
        AnimatedContainer(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(
              milliseconds: 1000
          ),
          color: _backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (){
                  setState(() {
                    _pageState = 0;
                  });
                },
                child: AnimatedContainer(
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: Duration(
                    milliseconds: 1000
                  ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text('Manage Your Events',
                          style: TextStyle(
                              color: _headingColor,
                              fontSize: 25
                          ),
                        ),
                        margin: EdgeInsets.only(
                          top: _headingTop,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.symmetric(
                            horizontal: 32
                        ),
                        child: Text('Managing all types of Events is now Easy and Efficient with EVENTO....',
                          style: TextStyle(
                              color: _headingColor,
                              fontSize: 15
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 32.0 ),
                child: Center(
                  child: Image.asset('assets/images/1.jpg'),
                ),
              ),
              Container(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_pageState == 0) {
                        _pageState = 1;
                      }
                      else{
                        _pageState = 0;
                      }
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.all(20.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0XFFBff4b5c),
                        borderRadius: BorderRadius.circular(32.0)
                    ),
                    child: Center(
                        child: Text("Let's Get Started",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                          ),
                        )
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        AnimatedContainer(
          height: _loginHeight,
          padding: EdgeInsets.all(32),
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(
                milliseconds: 1000
            ),
          width: _loginWidth,
          transform: Matrix4.translationValues(_loginXOffset, _loginYOffset, 1),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(_loginOpacity),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    margin : EdgeInsets.only(bottom: 40),
                    child: Text("Login To Continue",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0XFFB056674),
                    ),),
                  ),
                  InputWithIcon(
                    icon: Icons.email,
                    hint: "Type your Email...",
                  ),
                  SizedBox(height: 30,),
                  InputWithIcon(
                    icon: Icons.vpn_key,
                    hint: "Enter your Password",
                  ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {

                      });
                    },
                    child: primButton(
                      btntxt: "Login",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        _pageState = 2;
                      });
                    },
                    child: OutlineBtn(
                      btnText: "Sign Up",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        AnimatedContainer(
          height: _registerHeight,
          padding: EdgeInsets.all(32),
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(
                milliseconds: 1000
            ),
            transform: Matrix4.translationValues(0, _registerYOffset, 1),
            decoration: BoxDecoration(
                color: Color(0XFFBe0ece4),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)
                )
            ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    margin : EdgeInsets.only(bottom: 40),
                    child: Text("Create a New Account",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0XFFB056674),
                      ),)
                  ),
                  InputWithIcon(
                    icon: Icons.email,
                    hint: "Type your Email...",
                  ),
                  SizedBox(height: 30,),
                  InputWithIcon(
                    icon: Icons.vpn_key,
                    hint: "Enter your Password",
                  ),
                ],
              ),
              Column(
                children: [
                  primButton(
                    btntxt: "Sign Up",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        _pageState = 1;
                      });
                    },
                    child: OutlineBtn(
                      btnText: "Back to Login",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],

    );
  }
}

// ignore: camel_case_types
class primButton extends StatefulWidget {

  final String btntxt;
  primButton({this.btntxt});

  @override
  _primButtonState createState() => _primButtonState();
}

// ignore: camel_case_types
class _primButtonState extends State<primButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0XFFB056674),
        borderRadius: BorderRadius.circular(50)
      ),
      child: Center(
        child: Text(widget.btntxt,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white
        )),
      ),
    );
  }
}


class InputWithIcon extends StatefulWidget {
  final IconData icon;
  final String hint;
  InputWithIcon({this.icon, this.hint});

  @override
  _InputWithIconState createState() => _InputWithIconState();
}

class _InputWithIconState extends State<InputWithIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: Color(0XFFB056674),
              width: 2
          ),
          borderRadius: BorderRadius.circular(50)
      ),
      child: Row(
        children: <Widget>[
          Container(
              width: 60,
              child: Icon(
                widget.icon,
                size: 20,
                color: Color(0XFFB056674),
              )
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                  border: InputBorder.none,
                  hintText: widget.hint
              ),
            ),
          )
        ],
      ),
    );
  }
}



class OutlineBtn extends StatefulWidget {
  final String btnText;
  OutlineBtn({this.btnText});

  @override
  _OutlineBtnState createState() => _OutlineBtnState();
}

class _OutlineBtnState extends State<OutlineBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: Color(0XFFB056674),
              width: 2
          ),
          borderRadius: BorderRadius.circular(50)
      ),
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
          widget.btnText,
          style: TextStyle(
              color: Color(0XFFB056674),
              fontSize: 20
          ),
        ),
      ),
    );
  }
}

