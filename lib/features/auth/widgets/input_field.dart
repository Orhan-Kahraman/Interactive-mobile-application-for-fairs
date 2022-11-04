import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../../../constants/global_variables.dart';

class InputField extends StatefulWidget {
  InputField({
    Key? key,
    required this.hint,
    required this.iconData,
    this.inputType = TextInputType.name,
    this.isPassword = false,
  }) : super(key: key);
  final String hint;
  final IconData iconData;
  final TextInputType inputType;
  final bool isPassword;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  void initState() {
    super.initState();

    textController.addListener(() => setState(() {}));
  }

  bool _isVisible = true;
  final TextEditingController textController = TextEditingController();
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
            controller: textController,
            //autofocus: true,
            dragStartBehavior: DragStartBehavior.down,
            keyboardType: widget.inputType,
            obscureText: _isVisible,
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
                suffixIcon:
                    widget.isPassword == true && textController.text.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                _isVisible = !(_isVisible);
                              });
                            },
                            icon: _isVisible == true
                                ? const Icon(
                                    Ionicons.eye_off_outline,
                                    color: Colors.white54,
                                  )
                                : const Icon(
                                    Ionicons.eye_outline,
                                    color: Colors.white54,
                                  ))
                        : null,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: GlobalVariables.cristmasBlue,
                hintText: widget.hint,
                hintStyle: const TextStyle(color: Colors.white),
                prefixIcon: Icon(widget.iconData)),
          ),
        ),
      ),
    );
  }
}
