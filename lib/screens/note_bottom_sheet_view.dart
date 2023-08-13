import 'package:flutter/material.dart';
import 'package:notes_app_12/components/button.dart';
import 'package:notes_app_12/components/text_field_for_sheet.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final GlobalKey<FormState> formKey = GlobalKey();

  //AutovalidateMode => check empty field or refused input
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  /* any StatelessWidget must not change so if we create variable not final we must
    put it in StatefulWidget */
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    // SingleChildScrollView => make all child shirnk on the parent and we can not use spacer inside it
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        autovalidateMode: autoValidateMode,
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            TextFieldSheet(
              onSaved: (data) {
                title = data;
              },
              hint: "Title",
              maxLines: 1,
            ),
            TextFieldSheet(
              onSaved: (data) {
                subTitle = data;
              },
              hint: "Content",
              maxLines: 5,
            ),
            const SizedBox(
              height: 30,
            ),
            CunstomButton(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                } else {
                  // AutovalidateMode.always => while user input data this validate it char by char
                  autoValidateMode = AutovalidateMode.always;
                  setState((){});
                }
              },
              text: "Add",
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
