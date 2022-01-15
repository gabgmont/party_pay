import 'package:flutter/material.dart';

class NewsWidget extends StatelessWidget {
  final String image;
  final VoidCallback onTap;

  const NewsWidget({Key? key, required this.image, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: size.height * 0.12,
          width: size.width * 0.9,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(5),
            boxShadow: [BoxShadow(
              offset: Offset.fromDirection(1, 1.5),
              blurRadius: 0.5,
              spreadRadius: 0.5,
              color: Colors.black26
            )]
          ),
        ),
      ),
    );
  }
}
