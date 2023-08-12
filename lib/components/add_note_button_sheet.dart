import 'package:flutter/material.dart';
import 'package:notes_app_12/components/button.dart';
import 'package:notes_app_12/components/text_field_for_sheet.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    // SingleChildScrollView => make all child shirnk on the parent and we can not use spacer inside it
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          TextFieldSheet(
            hint: "Title",
            maxLines: 1,
          ),
          TextFieldSheet(
            hint: "Content",
            maxLines: 5,
          ),
          SizedBox(
            height: 30,
          ),
          CunstomButton(
            text: "Add",
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
