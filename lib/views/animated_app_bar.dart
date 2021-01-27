import 'package:flutter/material.dart';

class AnimatedAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => const Size.fromHeight(100);

  // These are required
  final AnimationController colorAnimationController;
  final Animation colorTween;

  AnimatedAppBar({
    @required this.colorAnimationController,
    @required this.colorTween,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
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
                onPressed: () => {},
                // _scaffoldKey.currentState.openDrawer()),
                icon: Image.asset(
                  'assets/gutter_logo.png',
                ),
              ),
            ),
            Container(
              width: 450,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: TextButton(
                      child: Text('About'),
                      onPressed: () {
                        print('Pressed');
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: TextButton(
                      child: Text('Services'),
                      onPressed: () {
                        print('Pressed');
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: TextButton(
                      child: Text('Featured'),
                      onPressed: () {
                        print('Pressed');
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: TextButton(
                      child: Text(
                        'Team',
                      ),
                      onPressed: () {
                        print('Pressed');
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: TextButton(
                      child: Text('Contact'),
                      onPressed: () {
                        print('Pressed');
                      },
                    ),
                  ),
                ],
              ),
            ),
            Material(
              color: Colors.red,
              elevation: 3,
              child: OutlinedButton(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '(305) 399 - 3000',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w100,
                        fontSize: 32),
                  ),
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
