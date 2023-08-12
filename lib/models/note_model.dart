import 'package:hive/hive.dart';

//part => used to generate file .g is abbreviation to generate
// the name must be the same as the file of model 
part 'note_model.g.dart';

/* @HiveType(typeId: Uniqe ID) => generate Type Adapter to add objects to database 
   because database can just accept primitive data type like int double string */
@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String content;
  @HiveField(2)
  final String date;
  NoteModel({required this.title, required this.content, required this.date});
}


/* after all this we type this line in terminal to generate Adapter type
  flutter packages pub run build_runner build */  