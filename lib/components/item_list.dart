import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_12/cubits/notes/notes_cubit.dart';
import 'package:notes_app_12/models/note_model.dart';

import 'item_container.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key});

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
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ItemContainer(note: notes[index],),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
