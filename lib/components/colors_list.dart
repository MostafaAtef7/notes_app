// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_12/cubits/add_note/add_note_cubit.dart';

import 'package:notes_app_12/models/note_model.dart';

import '../constants.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({
    Key? key,
    required this.isActive,
    required this.color,
  }) : super(key: key);
  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 23,
            ),
          )
        : CircleAvatar(
            backgroundColor: color,
            radius: 25,
          );
  }
}

class ColorsList extends StatefulWidget {
  const ColorsList({super.key});

  @override
  State<ColorsList> createState() => _ColorsListState();
}

class _ColorsListState extends State<ColorsList> {
  int state = 0;
  

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kColors.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                state = index;
                BlocProvider.of<AddNoteCubit>(context).color = kColors[index];
                setState(() {});
              },
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: ColorItem(
                  color: kColors[index],
                  isActive: state == index ? true : false,
                ),
              ));
        });
  }
}
