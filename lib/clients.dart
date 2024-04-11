import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:listview/client.dart';
import 'dart:convert';

import 'package:listview/entiteis.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({super.key});

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  Future<List<Cliente>> _getPropdutos() async {
    final url = Uri.https(
        "api.json-generator.com",
        "templates/hKRG_4et50hP/data",
        {"access_token": "j2ub3g5qys7w2j3z15cdxx1qdceph9ajebqry1u6"});

    var response = await http.get(url);
    var data = json.decode(response.body) as List;

    List<Cliente> clientes = [];

    Clientes lists = Clientes(data);
    lists.clientes.forEach((element) {
      clientes.add(Cliente.fromJson(element));
    });

    return clientes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Clients"),
        ),
        body: FutureBuilder(
          future: _getPropdutos(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Center(child: Text("Carregando..."));
            } else {
              final List<Cliente> clientes = snapshot.data!;
              return Container(
                margin: const EdgeInsets.all(15),
                child: ListView.builder(
                  itemCount: clientes.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(0),
                      decoration: const BoxDecoration(
                          border: Border(bottom: BorderSide(width: .1))),
                      child: ListTile(
                        leading: Icon(Icons.person),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${clientes[index].name}"),
                                Text(
                                  "${clientes[index].about.substring(
                                        1,
                                        30,
                                      )}...",
                                  style: TextStyle(fontSize: 10),
                                )
                              ],
                            )),
                            Row(
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 0, 12, 0),
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.green,
                                  ),
                                ),
                                Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ],
                            )
                          ],
                        ),
                        hoverColor: Colors.black12,
                        contentPadding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
                        onTap: () {
                          // Navigator.pushNamed(context, ClientPage.routeName,
                          //     arguments: Argumentos(clientes[index]));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ClientPage(client: clientes[index]),
                              ));
                        },
                      ),
                    );
                  },
                ),
              );
            }
          },
        ));
  }
}
