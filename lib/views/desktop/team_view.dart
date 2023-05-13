import 'package:flutter/material.dart';

class TeamView extends StatefulWidget {
  final GlobalKey key;

  TeamView({required this.key});

  @override
  _TeamViewState createState() => _TeamViewState();
}

class _TeamViewState extends State<TeamView> {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Color(0xFFF5F9FF),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Text('OUR TEAM',
                    style: Theme.of(context).textTheme.displaySmall),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                  bottom: 40,
                ),
                child: Text('CERTIFIED EXPERTS',
                    style: Theme.of(context).textTheme.headlineSmall),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network('https://i.imgur.com/UUcwLSbl.jpg'),
                  Image.network('https://i.imgur.com/IBVRB7vl.jpg'),
                  Image.network('https://i.imgur.com/hL9psgnl.jpg'),
                  Image.network('https://i.imgur.com/X3Jy8Jil.jpg'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Container(),
              ),
            ],
          ),
        ),

        // Second Section with pretty image========================================
        Container(
          // padding: EdgeInsets.symmetric(
          //   vertical: 100,
          // ),
          height: 1000,
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                child: Image.network(
                  'https://i.imgur.com/0tBzmrX.png',
                  scale: 1.75,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 200,
                    height: 700,
                    child: Image.network('https://i.imgur.com/ZexNYsyh.jpg',
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              PageView(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    alignment: Alignment(-0.5, 0.2),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          color: Colors.white,
                          height: 380,
                          width: 210,
                        ),
                        Container(
                          color: Colors.red,
                          height: 380,
                          width: 200,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage: NetworkImage(
                                      'https://i.imgur.com/8VeCL1v.jpg'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  '"The service from this company was fast and top quality."',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: Colors.white,
                                          fontFamily: 'Athelas'),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  'John Schmidt',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: Colors.white,
                                          fontFamily: 'Athelas',
                                          fontWeight: FontWeight.w900),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 5.0, bottom: 10.0),
                                child: Text(
                                  'Plantation, FL',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: Colors.white,
                                          fontFamily: 'Athelas',
                                          fontWeight: FontWeight.w900),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    // ElevatedButton(
                                    //   onPressed: previousPage,
                                    //   child: Text('Previous'),
                                    // ),
                                    ElevatedButton(
                                      onPressed: nextPage,
                                      child: Icon(Icons.arrow_forward_outlined,
                                          color: Colors.red),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment(-0.5, 0.2),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          color: Colors.white,
                          height: 380,
                          width: 210,
                        ),
                        Container(
                          color: Colors.red,
                          height: 380,
                          width: 200,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage: NetworkImage(
                                      'https://i.imgur.com/PBCI79h.jpg'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  '"Very nice young men, professional, excellent price. I will use them again if I need more gutters!"',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: Colors.white,
                                          fontFamily: 'Athelas'),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  'Terry Pedrianes',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: Colors.white,
                                          fontFamily: 'Athelas',
                                          fontWeight: FontWeight.w900),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 5.0, bottom: 10.0),
                                child: Text(
                                  'Coral Springs, FL',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: Colors.white,
                                          fontFamily: 'Athelas',
                                          fontWeight: FontWeight.w900),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    ElevatedButton(
                                      onPressed: previousPage,
                                      child: Icon(Icons.arrow_back_outlined,
                                          color: Colors.red),
                                    ),
                                    ElevatedButton(
                                      onPressed: nextPage,
                                      child: Icon(Icons.arrow_forward_outlined,
                                          color: Colors.red),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment(-0.5, 0.2),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          color: Colors.white,
                          height: 380,
                          width: 210,
                        ),
                        Container(
                          color: Colors.red,
                          height: 380,
                          width: 200,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage: NetworkImage(
                                      'https://i.imgur.com/WAAHCOD.jpg'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  '"Russell and his crew were great from the start as they installed gutters on my personal home."',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: Colors.white,
                                          fontFamily: 'Athelas'),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  'Trevor Jackson',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: Colors.white,
                                          fontFamily: 'Athelas',
                                          fontWeight: FontWeight.w900),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 5.0, bottom: 10.0),
                                child: Text(
                                  'Miramar, FL',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: Colors.white,
                                          fontFamily: 'Athelas',
                                          fontWeight: FontWeight.w900),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    ElevatedButton(
                                      onPressed: previousPage,
                                      child: Icon(Icons.arrow_back_outlined,
                                          color: Colors.red),
                                    ),
                                    ElevatedButton(
                                      onPressed: nextPage,
                                      child: Icon(Icons.arrow_forward_outlined,
                                          color: Colors.red),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment(-0.5, 0.2),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          color: Colors.white,
                          height: 380,
                          width: 210,
                        ),
                        Container(
                          color: Colors.red,
                          height: 380,
                          width: 200,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage: NetworkImage(
                                      'https://i.imgur.com/aRQf82v.jpg'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  '"I called Seamless Gutters and Russell  came out the next day to give me an estimate.."',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: Colors.white,
                                          fontFamily: 'Athelas'),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  'Jane Thomson',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: Colors.white,
                                          fontFamily: 'Athelas',
                                          fontWeight: FontWeight.w900),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 5.0, bottom: 10.0),
                                child: Text(
                                  'Weston, FL',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: Colors.white,
                                          fontFamily: 'Athelas',
                                          fontWeight: FontWeight.w900),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    ElevatedButton(
                                      onPressed: previousPage,
                                      child: Icon(Icons.arrow_back_outlined,
                                          color: Colors.red),
                                    ),
                                    // ElevatedButton(
                                    //   onPressed: nextPage,
                                    //   child: Icon(Icons.arrow_forward_outlined,
                                    //       color: Colors.red),
                                    // )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  void nextPage() {
    print('next page');
    _pageController.animateToPage(_pageController.page!.toInt() + 1,
        duration: Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  void previousPage() {
    print('prev page');
    _pageController.animateToPage(_pageController.page!.toInt() - 1,
        duration: Duration(milliseconds: 400), curve: Curves.easeIn);
  }
}
