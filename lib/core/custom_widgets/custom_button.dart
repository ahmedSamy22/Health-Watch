import 'package:flutter/material.dart';

Widget customButton({
  required Function() onPressed,
  Color background = const Color(0xffE70B89),
  required double width,
  required String text,
}) {
  return (Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: background,
    ),
    width: width,
    height: 50.0,
    child: MaterialButton(
      onPressed: onPressed,
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          fontSize: 18.0,
          color: Colors.white,
        ),
      ),
    ),
  ));
}
