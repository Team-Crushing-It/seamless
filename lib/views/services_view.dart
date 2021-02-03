import 'package:flutter/material.dart';
import 'package:seamless/main.dart';

class ServicesView extends StatelessWidget {
  final GlobalKey key;

  ServicesView({@required this.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xFFF5F9FF),
        height: 1100,
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
              child: Text('OUR SERVICES',
                  style: Theme.of(context).textTheme.headline3),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                bottom: 40,
              ),
              child: Text('WHAT DO WE DO?',
                  style: Theme.of(context).textTheme.headline5),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 350,
                  width: 350,
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.assignment_outlined,
                            color: Colors.red,
                            size: 80,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Free Quotes',
                              style: Theme.of(context).textTheme.headline6),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 30.0,
                            left: 30,
                            right: 30,
                            top: 10,
                          ),
                          child: Text(
                            'We are ready 24/7 to help you protect your home and that’s why we offer free quotes',
                            style: Theme.of(context).textTheme.bodyText2,
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 350,
                  width: 350,
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.check_box_outlined,
                            color: Colors.red,
                            size: 80,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Installation',
                              style: Theme.of(context).textTheme.headline6),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 30.0,
                            left: 30,
                            right: 30,
                            top: 10,
                          ),
                          child: Text(
                            'We install seamless gutters which are custom designed and colored for your needs',
                            style: Theme.of(context).textTheme.bodyText2,
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 350,
                  width: 350,
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.fact_check_outlined,
                            color: Colors.red,
                            size: 80,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Cleaning',
                              style: Theme.of(context).textTheme.headline6),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 30.0,
                            left: 30,
                            right: 30,
                            top: 10,
                          ),
                          child: Text(
                            'Maintenance can extend the life of your gutters by 2-3x, and that’s why we offer this routine service',
                            style: Theme.of(context).textTheme.bodyText2,
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 350,
                    width: 350,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.build_outlined,
                              color: Colors.red,
                              size: 80,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Repair',
                                style: Theme.of(context).textTheme.headline6),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 30.0,
                              left: 30,
                              right: 30,
                              top: 10,
                            ),
                            child: Text(
                              'It is common that most gutter problems are caused by improper installation. We can remedy this.',
                              style: Theme.of(context).textTheme.bodyText2,
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 350,
                    width: 350,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.water_damage_outlined,
                              color: Colors.red,
                              size: 80,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Splash Guards',
                                style: Theme.of(context).textTheme.headline6),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 30.0,
                              left: 30,
                              right: 30,
                              top: 10,
                            ),
                            child: Text(
                              'With very large spans of roof, water may overshoot the gutter. With splash guards we can fix this',
                              style: Theme.of(context).textTheme.bodyText2,
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 350,
                    width: 350,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.eco_outlined,
                              color: Colors.red,
                              size: 80,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Leaf Guards',
                                style: Theme.of(context).textTheme.headline6),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 30.0,
                              left: 30,
                              right: 30,
                              top: 10,
                            ),
                            child: Text(
                              'We also carry an assortment of leaf guards to protect your gutter from getting filled to begin with.',
                              style: Theme.of(context).textTheme.bodyText2,
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
