import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  final GlobalKey key;

  HomeView({@required this.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 1000, child: Text('home test2'));
  }
}
