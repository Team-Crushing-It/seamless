import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seamless_gutters/cubit/main_cubit.dart';

class DrawerMView extends StatelessWidget {
  final Function(String) pageChange;

  DrawerMView({
    @required this.pageChange,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, String>(
      builder: (context, state) {
        return Drawer(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: TextButton(
                  child: Text(
                    'About',
                    style: TextStyle(
                      color: (state == 'about') ? Colors.red : Colors.blue[900],
                    ),
                  ),
                  onPressed: () {
                    print('Pressed');
                    Navigator.pop(context);
                    pageChange('about');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: TextButton(
                  child: Text(
                    'Services',
                    style: TextStyle(
                      color:
                          (state == 'services') ? Colors.red : Colors.blue[900],
                    ),
                  ),
                  onPressed: () {
                    print('Pressed');
                    Navigator.pop(context);
                    pageChange('services');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: TextButton(
                  child: Text(
                    'Featured',
                    style: TextStyle(
                      color:
                          (state == 'featured') ? Colors.red : Colors.blue[900],
                    ),
                  ),
                  onPressed: () {
                    print('Pressed');
                    Navigator.pop(context);
                    pageChange('featured');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: TextButton(
                  child: Text(
                    'Team',
                    style: TextStyle(
                      color: (state == 'team') ? Colors.red : Colors.blue[900],
                    ),
                  ),
                  onPressed: () {
                    print('Pressed');
                    Navigator.pop(context);
                    pageChange('team');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: TextButton(
                  child: Text(
                    'Contact',
                    style: TextStyle(
                      color:
                          (state == 'contact') ? Colors.red : Colors.blue[900],
                    ),
                  ),
                  onPressed: () {
                    print('Pressed');
                    Navigator.pop(context);
                    pageChange('contact');
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
