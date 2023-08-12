import 'package:flutter/material.dart';

class ItemContainer extends StatelessWidget {
  const ItemContainer({required this.color, super.key});

  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 15, left: 15, top: 20, bottom: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        ListTile(
          title: const Text(
            "Title",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              "Build your career in Android using Flutter",
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete, size: 30, color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 26, top: 30),
          child: Text(
            "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
            style: TextStyle(
              color: Colors.black.withOpacity(0.7),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ]),
    );
  }
}
