import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_12/cubits/notes/notes_cubit.dart';

import 'note_bottom_sheet_view.dart';

import '../components/item_list.dart';
import '../components/appbar.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  // this make all notes get when just the app open
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllnotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //display bottom sheet that float on scaffold
          showModalBottomSheet(
              // isScrollControlled => make bottom sheet move to dynamic height
              isScrollControlled: true,
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
              icon: Icon(Icons.search),
            ),
            ItemList(),
          ],
        ),
      ),
    );
  }
}
