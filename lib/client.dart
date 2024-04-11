import 'package:flutter/material.dart';
import 'package:listview/entiteis.dart';

class Argumentos {
  final Cliente cliente;

  Argumentos(this.cliente);
}

class ClientPage extends StatefulWidget {
  static String routeName = "/client";
  const ClientPage({super.key});

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  @override
  Widget build(BuildContext context) {
    final argumentos = ModalRoute.of(context)?.settings.arguments as Argumentos;
    return Scaffold(
      appBar: AppBar(
        title: Text(argumentos.cliente.name),
      ),
      body: Container(
        height: 400,
        margin: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Name : ${argumentos.cliente.name}"),
            Text("Phone number : ${argumentos.cliente.phone}"),
            Text("Company : ${argumentos.cliente.company}"),
            Text("Address : ${argumentos.cliente.address}"),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("About ${argumentos.cliente.name}"),
                Container(
                    padding: EdgeInsets.all(10),
                    margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    decoration: BoxDecoration(
                        border: Border.all(width: .1),
                        borderRadius: BorderRadius.all(Radius.circular(3))),
                    child: Text("About  : ${argumentos.cliente.about}")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
