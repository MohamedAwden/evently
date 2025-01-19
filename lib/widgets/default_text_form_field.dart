import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_theme.dart';

class DefaultTextFormField extends StatefulWidget {
  DefaultTextFormField({
    super.key,
    this.controller,
    required this.hintText,
    this.onChanged,
    this.prefixIconImage,
    this.validator,
    this.isPassword = false,
    this.maxLine,
  });

  TextEditingController? controller;
  String hintText;
  String? prefixIconImage;
  void Function(String)? onChanged;
  String? Function(String?)? validator;
  bool isPassword;
  int? maxLine;

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  late bool isObscure = widget.isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: widget.prefixIconImage == null
            ? null
            : SvgPicture.asset(
                'assets/icons/${widget.prefixIconImage}.svg',
                height: 24,
                width: 24,
                fit: BoxFit.scaleDown,
                colorFilter: ColorFilter.mode(AppTheme.grey, BlendMode.srcIn),
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
      maxLines: widget.maxLine,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
