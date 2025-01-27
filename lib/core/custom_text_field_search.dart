import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextSearchField extends StatefulWidget {
  final String placeholder;
  bool? obscureText;
  final bool? checkMark;
  final Widget? suffix;
  final String? prefixImage;
  final int? maxLines;
  final TextDirection? textDirection;
  final TextEditingController? controller;
  final ValueChanged<String>? onChange;
  final ValueChanged<String>? onSubmit;

  CustomTextSearchField({Key? key, required this.placeholder, this.onChange, this.obscureText,this.onSubmit, this.controller, this.checkMark,this.textDirection = TextDirection.ltr , this.prefixImage, this.maxLines, this.suffix})
      : super(key: key);

  @override
  State<CustomTextSearchField> createState() => _CustomTextSearchFieldState();
}

class _CustomTextSearchFieldState extends State<CustomTextSearchField> {
  String languageCode = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      textDirection:widget.textDirection,
      controller: widget.controller,
      onChanged: widget.onChange,
      onSubmitted: widget.onSubmit,
      prefix: widget.prefixImage != null ?
      Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Image.asset("assets/images/${widget.prefixImage}",width: 20,height: 20,),
      ) : const SizedBox.shrink(),

      padding: const EdgeInsets.all(10),
      placeholder: widget.placeholder,
      obscureText: widget.obscureText ?? false,
      placeholderStyle: const TextStyle(
        color: Color(0xFF879EA4),
        fontSize: 16,
      ),
      // textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,

      ),
      decoration: BoxDecoration(
        color:  Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: const Color(0XFF1F546033)),
      ),
      suffix: widget.suffix ?? const SizedBox.shrink()
      ,
    );
  }
}
