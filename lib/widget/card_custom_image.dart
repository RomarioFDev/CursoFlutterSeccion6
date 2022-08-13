import 'package:flutter/material.dart';

class CustomCardImage extends StatelessWidget {
  const CustomCardImage({Key? key, required this.nameText, required this.url})
      : super(key: key);

  final String? nameText;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            FadeInImage(
              fadeInDuration: const Duration(milliseconds: 300),
              image: NetworkImage(url),
              placeholder: const AssetImage('assets/loading.gif'),
              width: double.infinity,
              height: 180,
              fit: BoxFit.cover,
            ),
            if (nameText != null)
              Container(
                alignment: AlignmentDirectional.centerEnd,
                padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20),
                child: Text(nameText ?? 'No title'),
              )
          ],
        ),
      ),
    );
  }
}
