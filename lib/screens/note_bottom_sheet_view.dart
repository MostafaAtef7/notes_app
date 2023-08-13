import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_12/components/button.dart';
import 'package:notes_app_12/components/text_field_for_sheet.dart';


import '../cubits/add_note/add_note_cubit.dart';
import '../models/note_model.dart';

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
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    // SingleChildScrollView => make all child shirnk on the parent and we can not use spacer inside it
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteLoading) {
            loading = true;
          } else if (state is AddNoteFailure) {
            loading = false;
          } else if (state is AddNoteSuccess) {
            loading = false;
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          // AbsorbPointer => if it take true it prevent us to use any thing in the screen
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
            child: Padding(
              // viewInsets => has data of keyboard
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SingleChildScrollView(
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
                      BlocBuilder<AddNoteCubit, AddNoteState>(
                        builder: (context, state) {
                          return CunstomButton(
                            loading: state is AddNoteLoading ? true : false,
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                //Saved Data
                                formKey.currentState!.save();

                                NoteModel noteModel = NoteModel(
                                    title: title!,
                                    content: subTitle!,
                                    date:
                                        "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}");
                                BlocProvider.of<AddNoteCubit>(context)
                                    .addNote(noteModel);
                              } else {
                                // AutovalidateMode.always => while user input data this validate it char by char
                                autoValidateMode = AutovalidateMode.always;
                                setState(() {});
                              }
                            },
                            text: "Add",
                          );
                        },
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
