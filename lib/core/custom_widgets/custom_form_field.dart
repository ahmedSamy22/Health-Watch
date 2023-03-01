import 'package:flutter/material.dart';

Widget customFormField({
  required TextEditingController controller,
  required TextInputType keyboardTybe,
  bool isPassword = false,
  IconData? prefixIcon,
  required String label,
  required String? Function(dynamic value) validator,
  Function()? onTap,
  Function(String)? onSubmit,
  Function(String)? onChange,
  Function()? suffixPressed,
  IconData? suffix,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: keyboardTybe,
    obscureText: isPassword,
    validator: validator,
    onTap: onTap,
    onChanged: onChange,
    onFieldSubmitted: onSubmit,
    decoration: InputDecoration(
      prefixIcon: Icon(prefixIcon),
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      suffixIcon: suffix != null
          ? IconButton(
              icon: Icon(suffix),
              onPressed: suffixPressed,
            )
          : null,
    ),
  );
}
