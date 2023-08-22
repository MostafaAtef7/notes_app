import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

//part => used to generate file .g is abbreviation to generate
// the name must be the same as the file of model
part 'note_model.g.dart';

/* @HiveType(typeId: Uniqe ID) => generate Type Adapter to add objects to database 
   because database can just accept primitive data type like int double string */
@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  // if we use Objects in this field we must create type adapter for it
  @HiveField(0)
  String title;
  @HiveField(1)
  String content;
  @HiveField(2)
  final String date;
  @HiveField(3)
  int color;
  NoteModel({required this.title, required this.content, required this.date, required this.color,
  });
}

/* after all this we type this line in terminal to generate Adapter type
  flutter packages pub run build_runner build */
