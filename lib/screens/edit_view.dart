import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_12/components/appbar.dart';
import 'package:notes_app_12/components/text_field_for_sheet.dart';
import 'package:notes_app_12/cubits/notes/notes_cubit.dart';
import 'package:notes_app_12/models/note_model.dart';
import '../components/edit_note_color_list.dart';

class EditView extends StatefulWidget {
  const EditView({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditView> createState() => _EditViewState();
}

class _EditViewState extends State<EditView> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          NoteAppbar(
            title: "Edit Note",
            icon: const Icon(Icons.check),
            onPressed: () {
              // used widget to access the statefulwidget variable
              // this line to save data after edit
              widget.note.title = title ?? widget.note.title;
              widget.note.content = content ?? widget.note.content;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllnotes();
              Navigator.pop(context);
            },
          ),
          TextFieldSheet(
            hint: "Title",
            onChanged: (value) {
              title = value;
            },
          ),
          TextFieldSheet(
            onChanged: (value) {
              content = value;
            },
            hint: "Content",
            maxLines: 5,
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 60,
            child: EditNoteColorList(note: widget.note,),
          )
        ],
      ),
    );
  }
}
