import 'package:flutter/material.dart';
import './UiFake.dart' if (dart.library.html) 'dart:ui' as ui;
import 'package:http/http.dart' as http;

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
  final _formKey = GlobalKey<FormState>();

  var fName = '';
  var fNumber = '';
  var fEmail = '';
  var fMessage = '';
  var updateText = '';

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  Future<String> postForm() async {
    // print(fName);
    // print(fNumber);
    // print(fEmail);
    // print(fMessage);
    final response = await http.post(
        // https://localhost:5001/mail-server-301117/us-central1/
        // "https://us-central1-mail-server-301117.cloudfunctions.net/sendMail?type=seamlesse&location=testing&name=" +

        "https://us-central1-mail-server-301117.cloudfunctions.net/sendMail?type=gutters&location=testing&name=" +
            fName +
            "&number=" +
            fNumber +
            "&email=" +
            fEmail +
            "&message=" +
            fMessage);

    if (response.statusCode == 200) {
      print('success');
      return 'success';
    } else {
      print('not success');
      return 'not success';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF5F9FF),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Container(),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Text('CONTACT US',
                style: Theme.of(context).textTheme.headline3),
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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.person, color: Colors.red),
                    title: TextFormField(
                      // autofocus: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a name';
                        }
                        fName = value;
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Name",
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.phone, color: Colors.red),
                    title: TextFormField(
                      // autofocus: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a number';
                        }
                        fNumber = value;
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Phone",
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.email, color: Colors.red),
                    title: TextFormField(
                      // autofocus: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter an email';
                        }
                        fEmail = value;
                        return null;
                      },
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
                    title: TextFormField(
                      // autofocus: true,
                      keyboardType: TextInputType.multiline,
                      minLines: 4,
                      maxLines: 4,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a message';
                        }
                        fMessage = value;
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Message",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.red,
                      child: OutlinedButton(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'SUBMIT',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            // If the form is valid, send email.
                            // postForm();

                            // if gucci, display a Snackbar.

                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                  duration: const Duration(seconds: 20),
                                  content: FutureBuilder<String>(
                                    future: postForm(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        print(snapshot.data);
                                        return Text('Message Sent !');
                                      } else if (snapshot.hasError) {
                                        return Text("${snapshot.error}");
                                      }
                                      return Text('Sending now..');
                                      // By default, show a loading spinner.
                                      // return CircularProgressIndicator();
                                    },
                                  )),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 100.0),
            child: Container(),
          ),
          Row(
            children: [
              Container(
                height: 700,
                color: Colors.red,
                child: Image.network(
                  'https://i.imgur.com/GKqdjYvh.png',
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: Container(
                  height: 700,
                  child: Image.network(
                    'https://i.imgur.com/JHcm5wAl.jpg',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
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
