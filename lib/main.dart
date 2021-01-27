import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:seamless/cubit/main_cubit.dart';

import 'views/animated_app_bar.dart';
import 'package:seamless/views/about_view.dart';
import 'package:seamless/views/services_view.dart';
import 'package:seamless/views/featured_view.dart';
import 'package:seamless/views/team_view.dart';
import 'package:seamless/views/contact_view.dart';

class PageObserver extends BlocObserver {
  @override
  void onChange(Cubit cubit, Change change) {
    print('${cubit.runtimeType} $change');
    super.onChange(cubit, change);
  }
}

void main() {
  Bloc.observer = PageObserver();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,

        // Define the default font family.
        // fontFamily: 'Georgia',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),

        //Setting the navigation text button theme to change color on hover
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle>(
              TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            foregroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered)) return Colors.red;
                return Colors.blue[900]; // Use the component's default.
              },
            ),
          ),
        ),
      ),
      home: BlocProvider(
        create: (_) => MainCubit(),
        child: MainView(),
      ),
    );
  }
}

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with TickerProviderStateMixin {
  ScrollController _scrollController;
  AnimationController _colorAnimationController;
  Animation _colorTween;

  RenderBox box;
  Offset position;
  double y;

  final homeKey = GlobalKey();

  @override
  void initState() {
    //Animation Controller and tween
    _colorAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    _colorTween = ColorTween(begin: Colors.transparent, end: Colors.red)
        .animate(_colorAnimationController);

    //Scroll controller and listener
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);

    super.initState();
  }

  //Passing the position from the controller to the cubit
  _scrollListener() {
    final _scrollPozish = _scrollController.position.pixels;
    context.read<MainCubit>().scrollPozish(_scrollPozish);
    _colorAnimationController.animateTo(_scrollPozish / 100);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AnimatedAppBar(
            colorAnimationController: _colorAnimationController,
            colorTween: _colorTween,
          ),

          // There is alot going on here.
          // The Notification Listener is specifically for the coloring of the app bar -- removed
          // And the controller is so I can scroll to other places. I think.

          body: Scrollbar(
            child: ListView(
              physics: ClampingScrollPhysics(),
              //Gotta remove that ton of pad
              padding: EdgeInsets.only(top: 0),
              controller: _scrollController,
              children: [
                AboutView(key: homeKey),
                ServicesView(),
                FeaturedView(),
                TeamView(),
                ContactView(),
              ],
            ),
          ),
          bottomNavigationBar: RaisedButton(
            onPressed: () => {
              print(homeKey),
              box = homeKey.currentContext.findRenderObject(),
              position =
                  box.localToGlobal(Offset.zero), //this is global position
              y = position.dy,
              _scrollController.animateTo(y,
                  curve: Curves.ease, duration: const Duration(seconds: 1)),
            },
            child: Text("Scroll to data"),
          ),
        );
      },
    );
  }
}
