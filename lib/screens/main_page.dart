import 'package:flutter/material.dart';

import '../components/item_container.dart';
import '../components/item_list.dart';
import '../components/note_appbar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
