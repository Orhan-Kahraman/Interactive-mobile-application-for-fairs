import 'package:flutter/material.dart';
import '../../../constants/global_variables.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.hint,
    required this.iconData,
  }) : super(key: key);
  final String hint;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
      child: SizedBox(
        height: 50,
        child: Material(
          elevation: 8,
          shadowColor: Colors.black87,
          borderRadius: BorderRadius.circular(30),
          child: TextField(
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: GlobalVariables.cristmasBlue,
                hintText: hint,
                hintStyle: const TextStyle(color: Colors.white),
                prefixIcon: Icon(iconData)),
          ),
        ),
      ),
    );
  }
}
