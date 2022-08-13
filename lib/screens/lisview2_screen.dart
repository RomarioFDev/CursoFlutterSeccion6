import 'package:flutter/material.dart';

class Listview2Screen extends StatelessWidget {
  const Listview2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final opciones = ['Megamen', 'Super mario', 'Minecraft', 'GTA 5'];
    return Scaffold(
        appBar: AppBar(
          title: const Text('Listview2Screen'),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) => ListTile(
                onTap: () {},
                leading: const Icon(Icons.g_mobiledata_outlined),
                trailing: const Icon(Icons.arrow_forward_ios),
                title: Text(
                  opciones[index],
                )),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: opciones.length));
  }
}
