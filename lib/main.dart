import 'package:flutter/material.dart';
import 'package:listview/client.dart';
import 'package:listview/clients.dart';

import 'package:listview/home.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

List<String> clientes = List.generate(200, (index) => "Cliente - ${index + 1}");

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: Colors.deepPurple)),
      title: "App clients",
      initialRoute: "/",
      routes: {
        "/": (context) => Home(),
        "/clients": (context) => ClientsPage(),
      },
    );
  }
}
