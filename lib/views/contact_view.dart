import 'package:flutter/material.dart';
import './UiFake.dart' if (dart.library.html) 'dart:ui' as ui;

//ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui' as ui;

class ContactView extends StatefulWidget {
  final GlobalKey key;

  ContactView({@required this.key});

  @override
  _ContactViewState createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  String linkMaps =
      "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3577.635218720348!2d-80.27437088522518!3d26.273499983407014!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88d905546f28cc9f%3A0xca7ba167bdb0252c!2s3456%20NW%20109th%20Way%2C%20Coral%20Springs%2C%20FL%2033065!5e0!3m2!1sen!2sus!4v1612321059698!5m2!1sen!2sus";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Container(),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 20,
          ),
          child:
              Text('CONTACT US', style: Theme.of(context).textTheme.headline3),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 20.0,
            bottom: 40,
          ),
          child: Text('GET IN TOUCH',
              style: Theme.of(context).textTheme.headline5),
        ),
        Container(
          width: 700,
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.person, color: Colors.red),
                title: TextField(
                  decoration: InputDecoration(
                    hintText: "Name",
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.phone, color: Colors.red),
                title: TextField(
                  decoration: InputDecoration(
                    hintText: "Phone",
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.email, color: Colors.red),
                title: TextField(
                  decoration: InputDecoration(
                    hintText: "Email",
                  ),
                ),
              ),
              const Divider(
                height: 1.0,
              ),
              ListTile(
                leading: const Icon(Icons.message, color: Colors.red),
                title: TextField(
                  keyboardType: TextInputType.multiline,
                  minLines: 4,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: "Message",
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 100.0),
          child: Container(),
        ),
        Row(
          children: [
            Container(
              color: Colors.red,
              child: new IframeScreen(800, 700, linkMaps),
            ),
            Expanded(
              child: Container(
                height: 700,
                child: Image.asset(
                  'assets/gutters2.jpg',
                  fit: BoxFit.fitHeight,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

//--------------------------------------------------------------------------I
//Code based on: Aseem Wangoo (Mar-22)                                      I
//https://medium.com/flutter-community/flutter-web-and-iframe-f26399aa1e2a  I
//--------------------------------------------------------------------------I

// ignore: must_be_immutable
class IframeScreen extends StatefulWidget {
  double w;
  double h;
  String src;

  IframeScreen(double _w, double _h, String _src) {
    this.w = _w;
    this.h = _h;
    this.src = _src;
  }

  @override
  _IframeScreenState createState() => _IframeScreenState(w, h, src);
}

class _IframeScreenState extends State<IframeScreen> {
  Widget _iframeWidget;
  final IFrameElement _iframeElement = IFrameElement();
  double _width;
  double _height;
  String _source;

  _IframeScreenState(double _w, double _h, String _src) {
    _width = _w;
    _height = _h;
    _source = _src;
  }

  @override
  void initState() {
    super.initState();
    _iframeElement.src = _source;
    _iframeElement.style.border = 'none';

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iframeElement,
    );

    _iframeWidget = HtmlElementView(
      key: UniqueKey(),
      viewType: 'iframeElement',
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      width: _width,
      child: _iframeWidget,
    );
  }
}
