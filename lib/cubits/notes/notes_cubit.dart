import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_app_12/models/note_model.dart';

import '../../constants.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes;
  void fetchAllnotes() {
    var notesBox = Hive.box<NoteModel>(kNoteBox);
    //get list of all notes in the box
    notes = notesBox.values.toList();
    print(notes!.length);
    emit(NotesSuccess(notes: notes!));
  }
}
