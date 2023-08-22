import 'package:flutter/material.dart';
import 'package:notes_app_12/models/note_model.dart';

import '../constants.dart';
import 'colors_list.dart';

class EditNoteColorList extends StatefulWidget {
  const EditNoteColorList({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteColorList> createState() => _EditNoteColorListState();
}

class _EditNoteColorListState extends State<EditNoteColorList> {
  // late => tell that the variable will not be null before it used
  late int state;
  @override
  void initState() {
    state = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kColors.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                state = index;
                widget.note.color = kColors[index].value;
                setState(() {});
              },
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: ColorItem(
                  color: kColors[index],
                  isActive: state == index ? true : false,
                ),
              ));
        });
  }
}
