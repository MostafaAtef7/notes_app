import 'package:flutter/material.dart';

import '../components/add_note_button_sheet.dart';

import '../components/item_list.dart';
import '../components/note_appbar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //display bottom sheet that float on scaffold
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return const AddNote();
              });
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            NoteAppbar(),
            ItemList(),
          ],
        ),
      ),
    );
  }
}
