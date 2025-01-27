import 'package:flutter/material.dart';
import 'package:pixelfield/core/app_colors.dart';
import 'package:pixelfield/core/custom_text.dart';
import 'package:pixelfield/core/helper.dart';

class TabsOptions extends StatefulWidget {
  final List<String> options;
  final ValueChanged<int> onChange;
  final List<Widget> children;
  final double leftPadding;
  final double topPadding;
  final double rightPadding;
  const TabsOptions(
      {Key? key,
        required this.options,
        required this.onChange,
        this.leftPadding = 0,
        this.rightPadding = 0,
        this.topPadding = 10,
        required this.children})
      : super(key: key);

  @override
  State<TabsOptions> createState() => _TabsOptionsState();
}

class _TabsOptionsState extends State<TabsOptions> {
  int childPosition = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration:  BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(5)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(


              widget.options.length,
                  (index) => Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      childPosition = index;
                      widget.onChange(index);
                    });
                  },
                  child:  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 7),
                    // margin:  EdgeInsets.only(top: widget.topPadding,bottom: 10,left: widget.leftPadding ,right: widget.rightPadding),
                    decoration: BoxDecoration(
                      color: childPosition == index ? AppColors.buttonColor : Colors.transparent,
                      // borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: CustomText(
                        text: widget.options[index],
                        style: TextStyle(
                          color: childPosition == index ? Colors.black : const Color(0XFF899194),
                          fontSize: 12,
                          fontFamily: fontFamilyLato,
                          fontWeight: FontWeight.w400,
                        ),

                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        widget.children[childPosition]
      ],
    );
  }
}
