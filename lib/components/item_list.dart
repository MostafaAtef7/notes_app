import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_12/cubits/notes/notes_cubit.dart';
import 'package:notes_app_12/models/note_model.dart';

import 'item_container.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key});
  final List<Color> color = const [
    Colors.yellow,
    Color.fromARGB(255, 99, 255, 107),
    Color.fromARGB(255, 253, 129, 107),
    Color.fromRGBO(59, 255, 229, 1),
    Color.fromARGB(255, 145, 68, 125),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ListView.builder(
              itemCount: state is NotesSuccess ? state.notes.length : 0,
              itemBuilder: (context, index) {
                final colorIndex = index % color.length;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ItemContainer(color: color[colorIndex], note: notes[index],),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
