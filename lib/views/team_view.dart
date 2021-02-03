import 'package:flutter/material.dart';

class TeamView extends StatelessWidget {
  final GlobalKey key;

  TeamView({@required this.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child:
                Text('OUR TEAM', style: Theme.of(context).textTheme.headline3),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              bottom: 40,
            ),
            child: Text('CERTIFIED EXPERTS',
                style: Theme.of(context).textTheme.headline5),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network('https://i.imgur.com/UUcwLSb.jpg'),
              Image.network('https://i.imgur.com/IBVRB7v.jpg'),
              Image.network('https://i.imgur.com/hL9psgn.jpg'),
              Image.network('https://i.imgur.com/X3Jy8Ji.jpg'),
            ],
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
