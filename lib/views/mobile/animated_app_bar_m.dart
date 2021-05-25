import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class AnimatedAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => const Size.fromHeight(100);

  // These are required
  final AnimationController colorAnimationController;
  final Animation colorTween;
  final Function(String) pageChange;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String state;

  AnimatedAppBar({
    @required this.colorAnimationController,
    @required this.colorTween,
    @required this.pageChange,
    @required this.scaffoldKey,
    @required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: AnimatedBuilder(
        animation: colorAnimationController,
        builder: (context, child) => Container(
          color: colorTween.value,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 200,
                height: 200,
                child: IconButton(
                  // Your drawer Icon
                  onPressed: () => pageChange('home'),
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
                          style: Theme.of(context).textTheme.headline2.copyWith(
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
                          style: Theme.of(context).textTheme.headline2.copyWith(
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
                          style: Theme.of(context).textTheme.headline2.copyWith(
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
                          style: Theme.of(context).textTheme.headline2.copyWith(
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
                          style: Theme.of(context).textTheme.headline2.copyWith(
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
                          style: Theme.of(context).textTheme.headline2.copyWith(
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Material(
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
                            '(954) 451-0909',
                            style: Theme.of(context).textTheme.headline1,
                          )
                        ],
                      ),
                    ),
                    onPressed: () async {
                      const url = "tel:9544510909";
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                  ),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
  }
}
