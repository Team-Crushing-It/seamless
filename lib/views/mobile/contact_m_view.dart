import 'package:flutter/material.dart';
import 'UIFake_m.dart' if (dart.library.html) 'dart:ui' as ui;
import 'package:http/http.dart' as http;

//ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui' as ui;

class ContactMView extends StatefulWidget {
  final GlobalKey key;

  ContactMView({@required this.key});

  @override
  _ContactMViewState createState() => _ContactMViewState();
}

class _ContactMViewState extends State<ContactMView> {
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
                                      _formKey.currentState.reset();
                                      print(snapshot.data);

                                      return Text('Message Sent !');
                                    } else if (snapshot.hasError) {
                                      return Text("${snapshot.error}");
                                    }
                                    return Text('Sending now..');
                                  },
                                ),
                              ),
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
          Container(
            width: double.infinity,
            color: Colors.red,
            child: Image.network(
              'https://i.imgur.com/GKqdjYvh.png',
              fit: BoxFit.fitHeight,
            ),
          ),
          Container(
            height: 400,
            child: Image.network(
              'https://i.imgur.com/JHcm5wAl.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}
