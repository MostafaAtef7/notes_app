import 'package:flutter/material.dart';

import 'note_bottom_sheet_view.dart';

import '../components/item_list.dart';
import '../components/appbar.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //display bottom sheet that float on scaffold
          showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              context: context,
              builder: (context) {
                /*there is no build method in this area so if we return widget 
                  and want to edit it we must restart the app so best way to 
                  return StatelessWidget class */
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
            NoteAppbar(
              title: "NOTES",
              icon: Icon(Icons.check),
            ),
            ItemList(),
          ],
        ),
      ),
    );
  }
}
