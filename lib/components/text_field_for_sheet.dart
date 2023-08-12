import 'package:flutter/material.dart';

class TextFieldSheet extends StatelessWidget {
  const TextFieldSheet({required this.hint, super.key, this.maxLines = 1});
  final String hint;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: TextField(
        maxLines: maxLines,
        cursorColor: Colors.orange,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle:
                const TextStyle(color: Color.fromARGB(255, 201, 201, 201)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.orange, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white, width: 2),
            )),
      ),
    );
  }
}
