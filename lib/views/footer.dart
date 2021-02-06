import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Container(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  width: 100,
                  child: Image.network('https://i.imgur.com/vmopqmw.png')),
              Container(
                  width: 100,
                  child: Image.network('https://i.imgur.com/vmopqmw.png')),
              Container(
                  width: 100,
                  child: Image.network('https://i.imgur.com/vmopqmw.png')),
              Container(
                  width: 100,
                  child: Image.network('https://i.imgur.com/vmopqmw.png')),
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
