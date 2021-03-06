import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'src/form_widgets.dart';
import 'src/http/mock_client.dart';
import 'src/sign_in_http.dart';
import 'src/support.dart';

// Set up a mock HTTP client.
final http.Client httpClient = MockClient();

void main() {
  runApp(FormApp());
}

final demos = [
  Demo(
    name: 'Войти как пользователь',
    route: '/signin_http',
    builder: (context) => SignInHttpDemo(
      httpClient: httpClient,
    ),
  ),
  Demo(
    name: 'Техподдержка',
    route: '/form_widgets',
    builder: (context) => FormWidgetsDemo(),
  ),
  Demo(
    name: 'Связаться с разработчиками',
    route: '/support',
    builder: (context) => Support(),
  ),
];

class FormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Samples',
      theme: ThemeData(primarySwatch: Colors.teal),
      routes: Map.fromEntries(demos.map((d) => MapEntry(d.route, d.builder))),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Samples'),
      ),
      body: ListView(
        children: [...demos.map((d) => DemoTile(d))],
      ),
    );
  }
}

class DemoTile extends StatelessWidget {
  final Demo demo;

  DemoTile(this.demo);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(demo.name),
      onTap: () {
        Navigator.pushNamed(context, demo.route);
      },
    );
  }
}

class Demo {
  final String name;
  final String route;
  final WidgetBuilder builder;

  const Demo({this.name, this.route, this.builder});
}
