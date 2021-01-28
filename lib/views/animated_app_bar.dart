import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:seamless/cubit/main_cubit.dart';

class AnimatedAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => const Size.fromHeight(100);

  // These are required
  final AnimationController colorAnimationController;
  final Animation colorTween;
  final Function(String) pageChange;
  final GlobalKey<ScaffoldState> scaffoldKey;

  AnimatedAppBar({
    @required this.colorAnimationController,
    @required this.colorTween,
    @required this.pageChange,
    @required this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, String>(
      builder: (context, state) {
        return ScreenTypeLayout(
          desktop: AnimatedBuilder(
            animation: colorAnimationController,
            builder: (context, child) => Container(
              color: colorTween.value,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: IconButton(
                      // Your drawer Icon
                      onPressed: () => {pageChange('home')},
                      // _scaffoldKey.currentState.openDrawer()),
                      icon: Image.asset(
                        'assets/gutter_logo.png',
                      ),
                    ),
                  ),
                  Container(
                    width: 500,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: TextButton(
                            child: Text(
                              'HOME',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w900,
                                color: (state == 'home')
                                    ? Colors.red
                                    : Colors.blue[900],
                              ),
                            ),
                            onPressed: () {
                              print('Pressed');
                              pageChange('home');
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: TextButton(
                            child: Text(
                              'ABOUT',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w900,
                                color: (state == 'about')
                                    ? Colors.red
                                    : Colors.blue[900],
                              ),
                            ),
                            onPressed: () {
                              print('Pressed');
                              pageChange('about');
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: TextButton(
                            child: Text(
                              'SERVICES',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w900,
                                color: (state == 'services')
                                    ? Colors.red
                                    : Colors.blue[900],
                              ),
                            ),
                            onPressed: () {
                              print('Pressed');
                              pageChange('services');
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: TextButton(
                            child: Text(
                              'FEATURED',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w900,
                                color: (state == 'featured')
                                    ? Colors.red
                                    : Colors.blue[900],
                              ),
                            ),
                            onPressed: () {
                              print('Pressed');
                              pageChange('featured');
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: TextButton(
                            child: Text(
                              'TEAM',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w900,
                                color: (state == 'team')
                                    ? Colors.red
                                    : Colors.blue[900],
                              ),
                            ),
                            onPressed: () {
                              print('Pressed');
                              pageChange('team');
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: TextButton(
                            child: Text(
                              'CONTACT',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w900,
                                color: (state == 'contact')
                                    ? Colors.red
                                    : Colors.blue[900],
                              ),
                            ),
                            onPressed: () {
                              print('Pressed');
                              pageChange('contact');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.red,
                    elevation: 10,
                    child: OutlinedButton(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.phone, color: Colors.white),
                            ),
                            Text(
                              '(305) 399 - 3000',
                              style: TextStyle(
                                  color: Colors.white,
                                  // fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w100,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          ),
          mobile: AnimatedBuilder(
            animation: colorAnimationController,
            builder: (context, child) => Container(
              color: colorTween.value,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                      // Your drawer Icon
                      onPressed: () => {
                            scaffoldKey.currentState.openDrawer(),
                          },
                      icon: Icon(Icons.menu, color: Colors.black)),
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: IconButton(
                      // Your drawer Icon
                      onPressed: () => {},
                      // _scaffoldKey.currentState.openDrawer()),
                      icon: Image.asset(
                        'assets/gutter_logo.png',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
