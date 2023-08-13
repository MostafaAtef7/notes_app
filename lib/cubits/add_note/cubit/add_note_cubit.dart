import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes_app_12/constants.dart';
import 'package:notes_app_12/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  addNote(NoteModel note) async {
    emit(AddNoteLoading());
    try {
  var notesBox = Hive.box<NoteModel>(kNoteBox);
  await notesBox.add(note);
  emit(AddNoteSuccess());
} catch (e) {
  emit(AddNoteFailure(errMessage: "Note didn't add, please try again"))
}
  }
}
