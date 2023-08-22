import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_12/cubits/notes/notes_cubit.dart';
import 'package:notes_app_12/models/note_model.dart';
import 'package:notes_app_12/screens/edit_view.dart';

class ItemContainer extends StatelessWidget {
  const ItemContainer({super.key, required this.note});


  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditView(
                      note: note,
                    )));
      },
      child: Container(
        padding:
            const EdgeInsets.only(right: 15, left: 15, top: 20, bottom: 20),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          ListTile(
            title: Text(
              note.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                note.content,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                //delete note
                note.delete();
                BlocProvider.of<NotesCubit>(context).fetchAllnotes();
              },
              icon: const Icon(Icons.delete, size: 30, color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 26, top: 30),
            child: Text(
              note.date,
              style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
