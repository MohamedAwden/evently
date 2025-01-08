import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DefaultTextFormField extends StatefulWidget {
  DefaultTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIconImage,
    this.validator,
    this.isPassword = false,
  });

  TextEditingController controller;
  String hintText;
  String? prefixIconImage;
  String? Function(String?)? validator;
  bool isPassword;

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  late bool isObscure = widget.isPassword ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: SvgPicture.asset(
          'assets/icons/${widget.prefixIconImage}.svg',
          height: 24,
          width: 24,
          fit: BoxFit.scaleDown,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  isObscure = !isObscure;
                  setState(() {});
                },
                icon: Icon(
                  isObscure
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
              )
            : null,
      ),
      obscureText: isObscure,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
