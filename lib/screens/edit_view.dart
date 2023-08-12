import 'package:flutter/material.dart';
import 'package:notes_app_12/components/button.dart';
import 'package:notes_app_12/components/note_appbar.dart';
import 'package:notes_app_12/components/text_field_for_sheet.dart';

class EditView extends StatelessWidget {
  const EditView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          NoteAppbar(title: "Edit Note", icon: Icons.check),
          TextFieldSheet(hint: "Title"),
          TextFieldSheet(
            hint: "Content",
            maxLines: 5,
          ),
          SizedBox(
            height: 30,
          ),
          CunstomButton(
            text: "Edit",
          ),
        ],
      ),
    );
  }
}
