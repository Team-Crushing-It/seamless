import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:seamless_gutters/extensions.dart';
//ignore: avoid_web_libraries_in_flutter

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
      throw Exception('not success');
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
              bottom: 24,
            ),
            child:
                Text('CONTACT', style: Theme.of(context).textTheme.headline3),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 700,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            ListTile(
                              leading:
                                  const Icon(Icons.person, color: Colors.red),
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
                              leading:
                                  const Icon(Icons.phone, color: Colors.red),
                              title: TextFormField(
                                // autofocus: true,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                ],
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
                              leading:
                                  const Icon(Icons.email, color: Colors.red),
                              title: TextFormField(
                                // autofocus: true,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter an email';
                                  } else if (!value.isEmail) {
                                    return 'Please enter a valid email';
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
                              leading:
                                  const Icon(Icons.message, color: Colors.red),
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
                                      style:
                                          Theme.of(context).textTheme.headline1,
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {
                                      // If the form is valid, send email.
                                      // postForm();

                                      // if gucci, display a Snackbar.

                                      showDialog(
                                        context: context,
                                        builder: (context) =>
                                            FutureBuilder<String>(
                                          future: postForm(),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              Timer(
                                                Duration(seconds: 1),
                                                () {
                                                  Navigator.of(context).pop();
                                                  _formKey.currentState.reset();
                                                },
                                              );

                                              return Center(
                                                child: Icon(
                                                  Icons.check,
                                                  color: Colors.green,
                                                  size: 80,
                                                ),
                                              );
                                            } else if (snapshot.hasError) {
                                              return Text("${snapshot.error}");
                                            }
                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          },
                                        ),
                                        barrierDismissible: false,
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
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 100.0),
            child: Container(),
          ),
          Row(
            children: [
              Container(
                height: 700,
                width: 700,
                color: Colors.red,
                child: Image.network(
                  'https://i.imgur.com/Eo8AhWq.png',
                  fit: BoxFit.none,
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
