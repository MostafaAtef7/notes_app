import 'package:flutter/material.dart';

class NoteAppbar extends StatelessWidget {
  const NoteAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "NOTES",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 70, 70, 70),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.search,
                size: 30,
              )),
        ],
      ),
    );
  }
}
