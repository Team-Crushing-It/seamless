import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seamless_gutters/cubit/main_cubit.dart';

class DrawerMView extends StatelessWidget {
  final Function(String) pageChange;

  DrawerMView({
    required this.pageChange,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, String>(
      builder: (context, state) {
        return Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: () {
                      pageChange('home');
                      Navigator.pop(context);
                    },
                    child: Image.network('https://i.imgur.com/vmopqmw.png')),
              ),
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: TextButton(
                  child: Text(
                    'About',
                    style: TextStyle(
                      fontSize: 16,
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
                padding: const EdgeInsets.all(11.0),
                child: TextButton(
                  child: Text(
                    'Services',
                    style: TextStyle(
                      fontSize: 16,
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
                padding: const EdgeInsets.all(11.0),
                child: TextButton(
                  child: Text(
                    'Featured',
                    style: TextStyle(
                      fontSize: 16,
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
                padding: const EdgeInsets.all(11.0),
                child: TextButton(
                  child: Text(
                    'Team',
                    style: TextStyle(
                      fontSize: 16,
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
                padding: const EdgeInsets.all(11.0),
                child: TextButton(
                  child: Text(
                    'Contact',
                    style: TextStyle(
                      fontSize: 16,
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
