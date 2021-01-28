import 'package:flutter/material.dart';

class ContactView extends StatelessWidget {
  final GlobalKey key;

  ContactView({@required this.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 1000, child: Text('contact'));
  }
}
