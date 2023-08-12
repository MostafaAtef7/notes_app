import 'package:flutter/material.dart';

import 'item_container.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key});
  final List<Color> color = const[
    Colors.yellow,
    Color.fromARGB(255, 99, 255, 107),
    Color.fromARGB(255, 253, 129, 107),
    Color.fromRGBO(59, 255, 229, 1),
    Color.fromARGB(255, 145, 68, 125),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: 
      Padding(
        padding: EdgeInsets.only(bottom: 20),
        child:ListView.builder(
        itemCount: 6453312,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ItemContainer(color: color[index % color.length]),
          );
        },
      ),
      ),
    );
  }
}
