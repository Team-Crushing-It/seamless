import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:async';

class HomeView extends StatefulWidget {
  final GlobalKey key;

  HomeView({required this.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late AnimationController _blockController;
  late AnimationController _overlayController;
  late AnimationController _slideController;
  late AnimationController _slideController2;
  late AnimationController _slideController3;

  @override
  void initState() {
    super.initState();

    // This is the controller for the faded blocks in the background
    _blockController =
        AnimationController(vsync: this, duration: Duration(seconds: 20))
          ..repeat();

    // This is the controller for the overlay
    _overlayController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    Timer(Duration(milliseconds: 3500),
        () => _overlayController.repeat(reverse: true));

    // Here we have 3 slide controllers for the introduction texts. This controls
    // both the slide and the fade in
    _slideController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 750));
    _slideController2 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _slideController3 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 750));

    //And the timers for when to start them
    Timer(Duration(milliseconds: 2200), () => _slideController.forward());
    Timer(Duration(milliseconds: 2700), () => _slideController2.forward());
    Timer(Duration(milliseconds: 3500), () => _slideController3.forward());

    // //This is for the fade in of the overlay, I think..
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   setState(() {
    //     _visible = false;
    //   });
    // });
  }

  @override
  void dispose() {
    _blockController.dispose();
    _overlayController.dispose();

    _slideController.dispose();
    _slideController2.dispose();
    _slideController3.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 700,
        width: double.infinity,
        // This row has two elements, both wrapped in an expanded so that they
        // both take 1/2 the screen
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // This is the first half
            Expanded(
              child: Container(
                height: 700,
                child: Stack(
                  children: [
                    // This is the first rotating block
                    Container(
                      alignment: Alignment(.2, -0.5),
                      child: AnimatedBuilder(
                        animation: _blockController,
                        builder: (_, child) {
                          return Transform.rotate(
                            angle: _blockController.value * 2 * math.pi,
                            child: child,
                          );
                        },
                        child: Image.asset(
                          'assets/block.png',
                          scale: 2,
                        ),
                      ),
                    ),
                    // This is the second rotating block
                    Container(
                      alignment: Alignment(1, .7),
                      child: AnimatedBuilder(
                        animation: _blockController,
                        builder: (_, child) {
                          return Transform.rotate(
                            angle: _blockController.value * 3 * math.pi,
                            child: child,
                          );
                        },
                        child: Image.asset(
                          'assets/block.png',
                          scale: 2,
                        ),
                      ),
                    ),
                    // This is for the house top which sits at the bottom
                    OverflowBox(
                      minWidth: 0.0,
                      minHeight: 700.0,
                      maxHeight: 1000,
                      maxWidth: 2000,
                      child: Container(
                        alignment: Alignment(.3, 1),
                        child: Image.asset(
                          'assets/house.png',
                          scale: 1.5,
                        ),
                      ),
                    ),
                    // This is for all the text
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 64.0),
                        child: Wrap(
                          runSpacing: 24,
                          children: [
                            // Your Trusted
                            SlideTransition(
                              position: Tween<Offset>(
                                begin: Offset(-1, 0),
                                end: Offset.zero,
                              ).animate(_slideController),
                              child: FadeTransition(
                                opacity: _slideController.drive(
                                    CurveTween(curve: Curves.easeInQuart)),
                                child: Text('YOUR TRUSTED',
                                    style:
                                        Theme.of(context).textTheme.displaySmall),
                              ),
                            ),
                            // Seamless Gutter Expert ...
                            SlideTransition(
                              position: Tween<Offset>(
                                begin: Offset(-1, 0),
                                end: Offset.zero,
                              ).animate(_slideController2),
                              child: FadeTransition(
                                opacity: _slideController2,
                                child: RichText(
                                  text: TextSpan(
                                    text: 'Seamless Gutters ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(
                                          color: Colors.red,
                                        ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Expert for Home or Business',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium!
                                            .copyWith(
                                              color: Colors.black,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            // get a free quote
                            SlideTransition(
                              position: Tween<Offset>(
                                begin: Offset(-1, 0),
                                end: Offset.zero,
                              ).animate(_slideController3),
                              child: FadeTransition(
                                opacity: _slideController3,
                                child: TextButton(
                                  child: Text(
                                    '--- GET A FREE QUOTE',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(
                                          color: Colors.red,
                                        ),
                                  ),
                                  onPressed: () {
                                    print('pressed');
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // This is the second half
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: OverflowBox(
                  minWidth: 0.0,
                  minHeight: 0.0,
                  maxWidth: 2000,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/house_picture.png',
                        // scale: .5,
                        // fit: BoxFit.fitWidth,
                      ),
                      FadeTransition(
                        opacity: _overlayController,
                        child: Image.asset(
                          'assets/house_overlay.png',
                          // scale: .5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
