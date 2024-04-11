import 'package:flutter/material.dart';
import 'package:listview/clients.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Icon(Icons.home),
      ),
      body: Stack(
        children: [
          Image.asset(
            "/images/pat1.jpg",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.all(20),
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "App Clients",
                    style: TextStyle(
                        fontSize: 30,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).colorScheme.primary),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(20))),
                      onPressed: () => Navigator.pushNamed(context, "/clients"),
                      child: Text(
                        "Let's start",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
