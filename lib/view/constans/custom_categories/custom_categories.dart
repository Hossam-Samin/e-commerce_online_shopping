import 'package:flutter/material.dart';

class CustomCategories extends StatefulWidget {
  CustomCategories({super.key, required this.images, required this.title});

  String images;
  String title;

  @override
  State<CustomCategories> createState() => _CustomCategoriesState();
}

class _CustomCategoriesState extends State<CustomCategories> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 60,
        width: 70,
        margin: const EdgeInsets.only(left: 5, right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.grey.shade200,
        ),
        child: Image.asset(widget.images),
      ),
      const SizedBox(height: 5),
      Text(
        widget.title,
        style: const TextStyle(fontFamily: "Rubik"),
      )
    ]);
  }
}
