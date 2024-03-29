import 'package:flutter/material.dart';

class AboutView extends StatefulWidget {
  final GlobalKey key;
  final String state;
  final Function() pageChange;

  AboutView(
      {required this.key, required this.state, required this.pageChange});

  @override
  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView>
    with SingleTickerProviderStateMixin {
  late AnimationController _slideController;

  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 750),
    );

    // Timer(Duration(milliseconds: 3200), () => _slideController.forward());
  }

  @override
  void didUpdateWidget(context) {
    if (widget.state == 'about') {
      _slideController.reset();
      _slideController.forward();
    }

    super.didUpdateWidget(context);
  }

  void triggerSlide() {
    _slideController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80.0),
      child: Container(
        height: 600,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment(1, -0.5),
                      height: 500,
                      child: Image.asset(
                        'assets/group_about.png',
                        scale: 1.5,
                      ),
                    ),
                    SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(-1, 0),
                        end: Offset.zero,
                      ).animate(_slideController),
                      child: Container(
                        alignment: Alignment(0.5, -0.2),
                        child: Image.asset(
                          'assets/animate_about.png',
                          scale: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Right hand section with About Us
            Expanded(
                child: Container(
              height: 600,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('ABOUT US',
                          style: Theme.of(context).textTheme.displaySmall),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Licensed & Insured',
                          style: Theme.of(context).textTheme.headlineSmall),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 500,
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text:
                                    'For more than 20 years, our gutter company has been proud' +
                                        ' to deliver long-lasting '),
                            TextSpan(
                                text: '6 - 7 in gutters. ',
                                style: TextStyle(fontWeight: FontWeight.w900)),
                            TextSpan(
                                text: ' We utilize proven techniques and advanced tools every step of the way,' +
                                    ' to make sure your gutters are installed with exceptional quality.' +
                                    '\n\nYou can take care of your home, roof, and lawn by installing seamless gutters. ' +
                                    'Seamless gutters keep the rainwater from damaging your yard and causing problems' +
                                    ' with your home’s exterior. Settle for nothing less than superior quality when you turn to our company for state-of-the-art seamless gutters.'),
                          ], style: Theme.of(context).textTheme.bodyMedium),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Material(
                        color: Colors.red,
                        elevation: 10,
                        child: OutlinedButton(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              'Learn More',
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                          ),
                          onPressed: () {
                            widget.pageChange();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
