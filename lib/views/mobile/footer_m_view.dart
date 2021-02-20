import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterM extends StatelessWidget {
  final Function(String) pageChange;

  FooterM({
    @required this.pageChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 500,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Container(),
          ),
          Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                        onTap: () {
                          pageChange('home');
                        },
                        child:
                            Image.network('https://i.imgur.com/vmopqmw.png')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.phone_outlined,
                            color: Colors.grey[600],
                            size: 30,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('+1 (305) 399-3000'),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.email_outlined,
                            color: Colors.grey[600],
                            size: 30,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('954gutters@gmail.com'),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.location_city_outlined,
                            color: Colors.grey[600],
                            size: 30,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('3456 NW 109th Way'),
                              Text('Coral Springs, FL 33065 USA')
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )),
          Container(
            // width: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8.0,
                    top: 70,
                  ),
                  child: Text(
                    'Essential Links',
                    style: TextStyle(
                      fontFamily: "Arial",
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      pageChange('about');
                    },
                    child: Text(
                      'About',
                      style: TextStyle(
                        fontFamily: "Arial",
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      pageChange('services');
                    },
                    child: Text(
                      'Services',
                      style: TextStyle(
                        fontFamily: "Arial",
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      pageChange('featured');
                    },
                    child: Text(
                      'Featured',
                      style: TextStyle(
                        fontFamily: "Arial",
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            // width: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8.0,
                    top: 70,
                  ),
                  child: Text(
                    'Services',
                    style: TextStyle(
                      fontFamily: "Arial",
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () async {
                      const url = "https://www.supremescreenenclosures.com";
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Text(
                      'Screen Enclosures',
                      style: TextStyle(
                        fontFamily: "Arial",
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () async {
                      const url = "https://www.supremehurricaneshutters.com";
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Text(
                      'Hurricane Shutters',
                      style: TextStyle(
                        fontFamily: "Arial",
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () async {
                      const url = "https://www.allcomfortsolutions.com";
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Text(
                      'All Services',
                      style: TextStyle(
                        fontFamily: "Arial",
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8.0,
                    top: 70,
                  ),
                  child: Text(
                    'Newsletter',
                    style: TextStyle(
                      fontFamily: "Arial",
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Sign up here to learn more about our upcoming products and promotions',
                    style: TextStyle(
                      fontFamily: "Arial",
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Material(
                    color: Colors.red,
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                duration: const Duration(seconds: 5),
                                content: Text('Added to List ! ')),
                          );
                        },
                        child: Text(
                          'Sign Up Now !',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: Container(),
          ),
        ],
      ),
    );
  }
}
