import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final int _numberPage = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _builderPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numberPage; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool condition) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: 8,
      width: condition ? 24 : 8,
      decoration: BoxDecoration(
        color: condition ? Colors.white : Color(0xFF7851D3),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  Widget pageBoard(String image, String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image(
              image: AssetImage(image),
              height: 300,
              width: 300,
            ),
          ),
          Text(
            title,
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            description,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.4, 0.7, 0.9],
            colors: [
              Color(0xFFC5E8B7),
              Color(0xFFABE098),
              Color(0xFF83D475),
              Color(0xFF57C84D),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                alignment: Alignment.centerRight,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      _pageController.jumpToPage(_numberPage);
                    });
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              Container(
                height: 550,
                child: PageView(
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: <Widget>[
                    pageBoard(
                      "lib/assets/images/Island.png",
                      "Title\nlong title",
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit,",
                    ),
                    pageBoard(
                      "lib/assets/images/Island.png",
                      "Title\nlong title 2",
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit,",
                    ),
                    pageBoard(
                      "lib/assets/images/Island.png",
                      "Title\nlong title 3",
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit,",
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _builderPageIndicator(),
              ),
              _currentPage != _numberPage - 1
                  ? Expanded(
                      child: Align(
                        alignment: FractionalOffset.bottomRight,
                        child: FlatButton(
                          onPressed: () {
                            setState(() {
                              _pageController.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease);
                            });
                          },
                          child: Text(
                            "Next",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Text(""),
            ],
          ),
        ),
      ),
      bottomSheet: _currentPage == _numberPage - 1
          ? Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0)),
                color: Colors.white,
              ),
              height: 70,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Text(
                    "Get Started",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
