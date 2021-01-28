import 'package:flutter/material.dart';

class TeamView extends StatelessWidget {
  final GlobalKey key;

  TeamView({@required this.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 1000, child: Text('team'));
  }
}
