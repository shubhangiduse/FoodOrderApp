import 'package:flutter/material.dart';

class BuildTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final bool? obsecureText;
  final String? labelText;
  final validator;
  final keyBoardType;
  final String? hintText;
  final int? maxLength;
  final TextAlign? customTextAlign;
  final FocusNode? focusNode;
  const BuildTextFormField({
    Key? key,
    this.controller,
    this.obsecureText = false,
    this.maxLength,
    this.focusNode,
    @required this.labelText,
    this.validator,
    this.keyBoardType,
    this.hintText,
    this.customTextAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      textAlign: customTextAlign == null ? TextAlign.left : TextAlign.center,
      maxLength: maxLength,
      keyboardType: keyBoardType,
      style:
          Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
      obscureText: obsecureText!,
      decoration: InputDecoration(
        labelText: labelText!,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        counterText: '',
        contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        fillColor: Colors.transparent,
        filled: false,
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.black54),
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.black54),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.black54),
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
      ),
      validator: validator,
    );
  }
}
