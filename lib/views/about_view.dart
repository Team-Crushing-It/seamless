import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  final GlobalKey key;

  AboutView({@required this.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80.0),
      child: Container(
        height: 1000,
        child: Row(
          children: [
            Expanded(
                child: Text('ABOUT US',
                    style: Theme.of(context).textTheme.headline3)),
            Expanded(
                child: Text('ABOUT US',
                    style: Theme.of(context).textTheme.headline3)),
          ],
        ),
      ),
    );
  }
}
