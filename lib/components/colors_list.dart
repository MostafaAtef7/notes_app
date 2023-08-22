import 'package:flutter/material.dart';
import 'package:notes_app_12/models/note_model.dart';

class ColorsList extends StatefulWidget {
  const ColorsList({super.key});

  @override
  State<ColorsList> createState() => _ColorsListState();
}

class _ColorsListState extends State<ColorsList> {
  final List<Color> color = const [
    Colors.yellow,
    Color.fromARGB(255, 99, 255, 107),
    Color.fromARGB(255, 253, 129, 107),
    Color.fromRGBO(59, 255, 229, 1),
    Color.fromARGB(255, 145, 68, 125),
  ];

  NoteModel? note;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: color.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20, right: 8, left: 4),
            child: GestureDetector(
              onTap: () {
                note!.color = color[index] ?? Colors.yellow;
              },
              child: CircleAvatar(
                backgroundColor: color[index],
                radius: 50,
              ),
            ),
          );
        });
  }
}
