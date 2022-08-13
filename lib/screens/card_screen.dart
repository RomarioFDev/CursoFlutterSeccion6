import 'package:flutter/material.dart';
import 'package:flutter_seccion6/widget/widget.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CardScreen'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        children: const [
          CustomCardType(),
          CustomCardImage(
            url: 'https://i.ytimg.com/vi/fq4N0hgOWzU/maxresdefault.jpg',
            nameText: 'Introduccion a flutter',
          ),
          CustomCardImage(
              nameText: 'Flutter and NodeJs',
              url: 'https://i.ytimg.com/vi/SBDI53ECgVk/maxresdefault.jpg')
        ],
      ),
    );
  }
}
