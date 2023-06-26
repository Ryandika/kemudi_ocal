import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextfield extends StatefulWidget {
  const MyTextfield({
    super.key,
    required this.controller,
    required this.label,
    required this.obscureText,
    this.errorText,
    required this.inputFormatters,
    this.keyboardType,
  });

  final dynamic controller;
  final Widget label;
  final bool obscureText;
  final String? errorText;
  final TextInputFormatter inputFormatters;
  final TextInputType? keyboardType;

  @override
  State<MyTextfield> createState() => _MyTextfieldState();
}

class _MyTextfieldState extends State<MyTextfield> {
// bool _submitted = false;

//   void _submit() {
//     setState(() => _submitted = true);
//     if (widget.errorText == null) {
//       widget.onSubmit(widget.controller.value.text);
//     }
//   }


// String? get _errorText {
//     // at any time, we can get the text from _controller.value.text
//     final text = widget.controller.value.text;
//     // Note: you can do your own custom validation here
//     // Move this logic this outside the widget for more testable code
//     if (text.trim().isEmpty) {
//       return 'Can\'t be empty';
//     }
//     if (text.length < 4) {
//       return 'Too short';
//     }
//     // return null if the text is valid
//     return null;
//   }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (_) => setState(() {}),
      controller: widget.controller,
      obscureText: widget.obscureText,
      inputFormatters: [
        widget.inputFormatters,
      ],
      decoration: InputDecoration(
        // errorText: _errorText,
        fillColor: Colors.grey.shade200,
        // filled: true,
        alignLabelWithHint: true,
        label: widget.label,
        errorText: widget.errorText,
        hintStyle: TextStyle(color: Colors.grey[500]),
      ),
      keyboardType: widget.keyboardType,
    );
  }
}
