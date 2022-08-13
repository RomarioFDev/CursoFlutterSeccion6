import 'package:flutter/material.dart';

class CustomCardType extends StatelessWidget {
  const CustomCardType({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const ListTile(
            leading: Icon(Icons.flutter_dash),
            title: Text('Flutter Mobil'),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: () {}, child: const Text('Cancelar')),
                TextButton(onPressed: () {}, child: const Text('Ok')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
