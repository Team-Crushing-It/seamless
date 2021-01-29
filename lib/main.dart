import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';

import 'package:seamless/cubit/main_cubit.dart';

import 'package:seamless/views/drawer_view.dart';
import 'views/animated_app_bar.dart';
import 'package:seamless/views/home_view.dart';
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
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,

        // Define the default font family.
        // fontFamily: 'Athelas',

        textTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: "Arial",
            fontWeight: FontWeight.w700,
            // color: Color(0xFF1B1B26),
            fontSize: 20,
          ),
          headline2: TextStyle(
            fontFamily: "Arial",
            fontWeight: FontWeight.w900,
            // color: Color(0xFF1B1B26),
            fontSize: 12,
          ),
          headline3: TextStyle(
            fontFamily: "Athelas",
            fontWeight: FontWeight.w900,
            color: Colors.red,
            fontSize: 18,
          ),
          headline4: TextStyle(
            fontFamily: "Athelas",
            fontWeight: FontWeight.w700,
            // color: Color(0xFF1B1B26),
            fontSize: 48,
          ),
        ),

        //Setting the navigation text button theme to change color on hover
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle>(
              TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
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

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final servicesKey = GlobalKey();
  final featuredKey = GlobalKey();
  final teamKey = GlobalKey();
  final contactKey = GlobalKey();

  @override
  void initState() {
    //Animation Controller and tween
    _colorAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    _colorTween = ColorTween(begin: Colors.transparent, end: Colors.white)
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
    _colorAnimationController.animateTo(_scrollPozish / 300);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, String>(
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          key: scaffoldKey,
          drawer: DrawerView(
            pageChange: (page) {
              if (page == 'home') {
                context.read<MainCubit>().home(homeKey);
              } else if (page == 'about') {
                context.read<MainCubit>().about(aboutKey);
              } else if (page == 'services') {
                context.read<MainCubit>().services(servicesKey);
              } else if (page == 'featured') {
                context.read<MainCubit>().featured(featuredKey);
              } else if (page == 'team') {
                context.read<MainCubit>().team(teamKey);
              } else if (page == 'contact') {
                context.read<MainCubit>().contact(contactKey);
              }
            },
          ),
          appBar: AnimatedAppBar(
            scaffoldKey: scaffoldKey,
            colorAnimationController: _colorAnimationController,
            colorTween: _colorTween,
            // selected: state,
            pageChange: (page) {
              if (page == 'home') {
                context.read<MainCubit>().home(homeKey);
              } else if (page == 'about') {
                context.read<MainCubit>().about(aboutKey);
              } else if (page == 'services') {
                context.read<MainCubit>().services(servicesKey);
              } else if (page == 'featured') {
                context.read<MainCubit>().featured(featuredKey);
              } else if (page == 'team') {
                context.read<MainCubit>().team(teamKey);
              } else if (page == 'contact') {
                context.read<MainCubit>().contact(contactKey);
              }
            },
          ),
          //==================================================================
          body: Scrollbar(
            child: SingleChildScrollView(
              //Gotta remove that ton of pad
              padding: EdgeInsets.only(top: 0),
              controller: _scrollController,
              child: Container(
                width: double.infinity,
                //Making this a stack so that I can align widgets between other widgets
                child: Column(
                  children: [
                    HomeView(key: homeKey),
                    AboutView(key: aboutKey),
                    ServicesView(key: servicesKey),
                    FeaturedView(key: featuredKey),
                    TeamView(key: teamKey),
                    ContactView(key: contactKey),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
