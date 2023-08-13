import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app_12/models/note_model.dart';
import 'package:notes_app_12/screens/edit_view.dart';
import 'package:notes_app_12/screens/main_view.dart';

void main() async {
  // Initialize Hive
  await Hive.initFlutter();
  // create box to store database
  await Hive.openBox("notes_box");
  // register to the adapter that we create
  Hive.registerAdapter(NoteModelAdapter());
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: "Poppins",
      ),
      routes: {
        'mainView': (context) => const MainView(),
        'editView': (context) => const EditView(),
      },
      initialRoute: 'mainView',
    );
  }
}
