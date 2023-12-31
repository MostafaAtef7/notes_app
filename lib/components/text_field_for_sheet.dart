import 'package:flutter/material.dart';

class TextFieldSheet extends StatelessWidget {
  const TextFieldSheet(
      {required this.hint, super.key, this.maxLines = 1, this.onSaved, this.onChanged});
  final String hint;
  final int maxLines;
  final void Function(String?)? onSaved;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: TextFormField(
        onChanged: onChanged,
        onSaved: onSaved,
        validator: (data) {
          // here we check at first if data == null in "data?" if null then true if it's not null check if it empty
          if (data?.isEmpty ?? true) {
            return "Field is Required";
          }
          return null;
        },
        maxLines: maxLines,
        cursorColor: const Color.fromARGB(255, 62, 182, 238),
        decoration: InputDecoration(
            hintText: hint,
            hintStyle:
                const TextStyle(color: Color.fromARGB(255, 201, 201, 201)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  color: Color.fromARGB(255, 62, 182, 238), width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white, width: 2),
            )),
      ),
    );
  }
}
