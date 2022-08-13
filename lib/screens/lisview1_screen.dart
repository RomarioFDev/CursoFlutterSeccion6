import 'package:flutter/material.dart';

class Listview1Screen extends StatelessWidget {
  const Listview1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final opciones = ['Megamen', 'Super mario', 'Minecraft', 'GTA 5'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listview1Screen'),
      ),
      body: ListView(
        children: [
          ...opciones
              .map((game) => ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.cloud_circle),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    title: Text(game),
                  ))
              .toList()
        ],
      ),
    );
  }
}
