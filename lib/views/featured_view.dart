import 'package:flutter/material.dart';

class FeaturedView extends StatelessWidget {
  final GlobalKey key;

  FeaturedView({@required this.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 1000, child: Text('featured'));
  }
}
