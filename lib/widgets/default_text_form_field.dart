import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DefaultTextFormField extends StatelessWidget {
  DefaultTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIconImage,
    this.validator,
  });

  TextEditingController controller;
  String hintText;
  String? prefixIconImage;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: SvgPicture.asset(
            'assets/icons/$prefixIconImage.svg',
            height: 24,
            width: 24,
            fit: BoxFit.scaleDown,
          ),),
    );
  }
}
