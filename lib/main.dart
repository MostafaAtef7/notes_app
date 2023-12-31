import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app_12/constants.dart';
import 'package:notes_app_12/cubits/notes/notes_cubit.dart';
import 'package:notes_app_12/cubits/simple_bloc_observer.dart';
import 'package:notes_app_12/models/note_model.dart';
import 'package:notes_app_12/screens/edit_view.dart';
import 'package:notes_app_12/screens/main_view.dart';

void main() async {
  // Initialize Hive
  await Hive.initFlutter();
  // register to the adapter that we create
  Hive.registerAdapter(NoteModelAdapter());
  // create box to store database
  await Hive.openBox<NoteModel>(kNoteBox);

  Bloc.observer = SimpleBlocObserver();
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: "Poppins",
        ),
        routes: {
          'mainView': (context) => const MainView(),
        },
        initialRoute: 'mainView',
      ),
    );
  }
}
