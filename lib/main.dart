import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:seamless_gutters/cubit/main_cubit.dart';

import 'package:seamless_gutters/views/mobile/drawer_m_view.dart';
import 'package:seamless_gutters/views/mobile/home_m_view.dart';
import 'package:seamless_gutters/views/mobile/about_m_view.dart';
import 'package:seamless_gutters/views/mobile/services_m_view.dart';
import 'package:seamless_gutters/views/mobile/featured_m_view.dart';
import 'package:seamless_gutters/views/mobile/team_m_view.dart';
import 'package:seamless_gutters/views/mobile/contact_m_view.dart';
import 'package:seamless_gutters/views/mobile/footer_m_view.dart';

import 'package:seamless_gutters/views/desktop/animated_app_bar.dart';
import 'package:seamless_gutters/views/desktop/home_view.dart';
import 'package:seamless_gutters/views/desktop/about_view.dart';
import 'package:seamless_gutters/views/desktop/services_view.dart';
import 'package:seamless_gutters/views/desktop/featured_view.dart';
import 'package:seamless_gutters/views/desktop/team_view.dart';
import 'package:seamless_gutters/views/desktop/contact_view.dart';
import 'package:seamless_gutters/views/desktop/footer.dart';

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
      title: 'Seamless Gutters',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,

        //Text theme for mobile
        accentTextTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.white,
            fontFamily: "Arial",
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
          headline2: TextStyle(
            fontFamily: "Arial",
            fontWeight: FontWeight.w900,
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
          headline5: TextStyle(
            fontFamily: "Athelas",
            fontWeight: FontWeight.w700,
            color: Colors.black,
            fontSize: 32,
          ),
          headline6: TextStyle(
            fontFamily: "Arial",
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
          bodyText1: TextStyle(
            fontFamily: "Arial",
            fontWeight: FontWeight.w900,
            // color: Color(0xFF1B1B26),
            fontSize: 12,
            height: 2,
            letterSpacing: 2.0,
          ),
          bodyText2: TextStyle(
            fontFamily: "Arial",
            fontWeight: FontWeight.w300,
            color: Colors.grey[700],
            fontSize: 12,
            height: 2,
            letterSpacing: 2.0,
          ),
        ),

        //Text theme for web
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.white,
            fontFamily: "Arial",
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
          headline2: TextStyle(
            fontFamily: "Arial",
            fontWeight: FontWeight.w900,
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
          headline5: TextStyle(
            fontFamily: "Athelas",
            fontWeight: FontWeight.w700,
            color: Colors.black,
            fontSize: 32,
          ),
          headline6: TextStyle(
            fontFamily: "Arial",
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
          bodyText1: TextStyle(
            fontFamily: "Arial",
            fontWeight: FontWeight.w900,
            // color: Color(0xFF1B1B26),
            fontSize: 12,
            height: 2,
            letterSpacing: 2.0,
          ),
          bodyText2: TextStyle(
            fontFamily: "Arial",
            fontWeight: FontWeight.w300,
            color: Colors.grey[700],
            fontSize: 12,
            height: 2,
            letterSpacing: 2.0,
          ),
        ),

        //This is useful but I ain't using it !
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

  @override
  void dispose() {
    _colorAnimationController.dispose();
    _scrollController.dispose();

    super.dispose();
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
        return ScreenTypeLayout(
          mobile: Scaffold(
            extendBodyBehindAppBar: true,
            key: scaffoldKey,
            drawer: DrawerMView(
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
              state: state,
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
                // physics: NeverScrollableScrollPhysics(),
                // controller: _scrollController2,
                //Gotta remove that ton of pad
                padding: EdgeInsets.only(top: 0),

                child: Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      HomeMView(key: homeKey),
                      AboutMView(
                        key: aboutKey,
                        state: state,
                        pageChange: () =>
                            {context.read<MainCubit>().contact(contactKey)},
                      ),
                      ServicesMView(key: servicesKey),
                      FeaturedMView(key: featuredKey),
                      TeamMView(key: teamKey),
                      ContactMView(key: contactKey),
                      FooterM(
                        pageChange: (page) {
                          if (page == 'home') {
                            context.read<MainCubit>().home(homeKey);
                          } else if (page == 'about') {
                            context.read<MainCubit>().about(aboutKey);
                          } else if (page == 'services') {
                            context.read<MainCubit>().services(servicesKey);
                          } else if (page == 'featured') {
                            context.read<MainCubit>().featured(featuredKey);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //Desktop view
          desktop: Scaffold(
            extendBodyBehindAppBar: true,
            key: scaffoldKey,
            appBar: AnimatedAppBar(
              scaffoldKey: scaffoldKey,
              colorAnimationController: _colorAnimationController,
              colorTween: _colorTween,
              state: state,
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
                      AboutView(
                        key: aboutKey,
                        state: state,
                        pageChange: () =>
                            {context.read<MainCubit>().contact(contactKey)},
                      ),
                      ServicesView(key: servicesKey),
                      FeaturedView(key: featuredKey),
                      TeamView(key: teamKey),
                      ContactView(key: contactKey),
                      Footer(
                        pageChange: (page) {
                          if (page == 'home') {
                            context.read<MainCubit>().home(homeKey);
                          } else if (page == 'about') {
                            context.read<MainCubit>().about(aboutKey);
                          } else if (page == 'services') {
                            context.read<MainCubit>().services(servicesKey);
                          } else if (page == 'featured') {
                            context.read<MainCubit>().featured(featuredKey);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // bottomNavigationBar: Footer(),
          ),
        );
      },
    );
  }
}
