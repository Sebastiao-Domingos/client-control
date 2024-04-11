import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:listview/clients.dart';
import 'package:listview/entiteis.dart';

// class Argumentos {
//   final Cliente cliente;

//   Argumentos(this.cliente);
// }

class ClientPage extends StatefulWidget {
  static String routeName = "/client";
  final Cliente client;
  const ClientPage({super.key, required this.client});

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  @override
  Widget build(BuildContext context) {
    // final argumentos = ModalRoute.of(context)?.settings.arguments as Argumentos;
    print(widget.client.picture);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.client.name),
      ),
      body: Container(
        height: 400,
        margin: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "images/pat1.jpg",
              height: 200,
            ),
            Text(
              "${widget.client.name}",
              style: TextStyle(fontSize: 30),
            ),
            Text("Phone number : ${widget.client.phone}"),
            Text("Company : ${widget.client.company}"),
            Text("Address : ${widget.client.address}"),
            Text("${widget.client.about}"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ClientsPage()));
                    },
                    child: Text("Voltar")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ClientsPage()));
                    },
                    child: Icon(Icons.edit)),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ClientsPage()));
                    },
                    child: Icon(Icons.delete))
              ],
            )
          ],
        ),
      ),
    );
  }
}
