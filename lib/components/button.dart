import 'package:flutter/material.dart';

class CunstomButton extends StatelessWidget {
  const CunstomButton({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      //MediaQuery.of(context).size.width => let us access data of the mobile that the user use like size
      width: 350,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.orange,
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
