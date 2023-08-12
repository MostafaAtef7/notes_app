import 'package:flutter/material.dart';

import '../components/item_container.dart';
import '../components/note_appbar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            NoteAppbar(),
            ItemContainer(),
          ],
        ),
      ),
    );
  }
}
