import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int _pageState = 0;
  double _loginYOffset = 0;
  double _loginYOffsetSecond = 0;

  double cardWidth = 0;
  double cardHeight = 0;

  double _widthTransform = 0;
  var _backgroundColor = Colors.white;
  var _canvasColor = Colors.white;
  var _changeColorContent = Color(0xFFB49c96b);

  @override
  Widget build(BuildContext context) {
    cardHeight = MediaQuery.of(context).size.height;
    cardWidth = MediaQuery.of(context).size.width;

    switch (_pageState) {
      case 0:
        _backgroundColor = Colors.white;
        _changeColorContent = Color(0xFFB49c96b);

        _widthTransform = cardWidth;
        _loginYOffset = cardHeight;
        _loginYOffsetSecond = cardHeight;
        break;
      case 1:
        _widthTransform = cardWidth;
        _backgroundColor = Color(0xFFB49c96b);
        _changeColorContent = Colors.white;
        _canvasColor = Colors.white;
        _loginYOffset = 240;
        _loginYOffsetSecond = cardHeight;
        break;
      case 2:
        _widthTransform = 350;
        _backgroundColor = Color(0xFFB49c96b);
        _changeColorContent = Colors.white;
        _canvasColor = Colors.lightGreenAccent;
        _loginYOffset = 200;
        _loginYOffsetSecond = 220;
        break;
    }

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _pageState = 0;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              color: _backgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 50, bottom: 20),
                          child: Text(
                            "Login Page",
                            style: TextStyle(fontSize: 28),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            "This app is for learning and make it simple, app mobile and minimalis",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Center(
                      child: Image.asset(
                        'lib/assets/images/Island.png',
                      ),
                    ),
                  ),
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_pageState != 0) {
                            _pageState = 0;
                          } else {
                            _pageState = 1;
                          }
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(30),
                        padding: EdgeInsets.all(20),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: _changeColorContent,
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: Text(
                            "Get Started",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          AnimatedContainer(
            width: _widthTransform,
            padding: const EdgeInsets.all(30),
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(milliseconds: 1000),
            transform: Matrix4.translationValues(0, _loginYOffset, 1),
            decoration: BoxDecoration(
              color: _canvasColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Column(
              children: [
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 40),
                TextField(
                  decoration: new InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(50),
                        ),
                      ),
                      filled: true,
                      hintStyle: new TextStyle(color: Colors.grey[800]),
                      hintText: "E-mail",
                      fillColor: Colors.white70),
                ),
                SizedBox(height: 40),
                TextField(
                  decoration: new InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(50),
                        ),
                      ),
                      filled: true,
                      hintStyle: new TextStyle(color: Colors.grey[800]),
                      hintText: "Password",
                      fillColor: Colors.white70),
                ),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _pageState = 2;
                    });
                  },
                  child: Text(
                    "Register",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(height: 60),
                Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          AnimatedContainer(
            padding: const EdgeInsets.all(30),
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(milliseconds: 1000),
            transform: Matrix4.translationValues(0, _loginYOffsetSecond, 1),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        setState(() {
                          _pageState = 1;
                        });
                      },
                    ),
                  ],
                ),
                Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 40),
                TextField(
                  decoration: new InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(50),
                        ),
                      ),
                      filled: true,
                      hintStyle: new TextStyle(color: Colors.grey[800]),
                      hintText: "E-mail",
                      fillColor: Colors.white70),
                ),
                SizedBox(height: 40),
                TextField(
                  decoration: new InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(50),
                        ),
                      ),
                      filled: true,
                      hintStyle: new TextStyle(color: Colors.grey[800]),
                      hintText: "Password",
                      fillColor: Colors.white70),
                ),
                SizedBox(height: 75),
                Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                    child: Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
