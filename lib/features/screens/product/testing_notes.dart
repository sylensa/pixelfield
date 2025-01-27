import 'package:flutter/material.dart';
import 'package:pixelfield/core/app_colors.dart';
import 'package:pixelfield/core/custom_image_widget.dart';
import 'package:pixelfield/core/custom_text.dart';
import 'package:pixelfield/core/helper.dart';
import 'package:pixelfield/core/text_styles.dart';
import 'package:pixelfield/features/screens/product/widget/video_player.dart';
import 'package:pixelfield/features/screens/widgets/testing_note_widget.dart';

class TestingNotes extends StatefulWidget {
  const TestingNotes({super.key});

  @override
  State<TestingNotes> createState() => _TestingNotesState();
}

class _TestingNotesState extends State<TestingNotes> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20,),
        const SizedBox(
          height: 180,
            child: BackVideoPlayer()
        ),
        const SizedBox(height: 10,),
        const CustomText(text: "Tasting notes", style: TextStyles.tabStyle),
        CustomText(text: "by Charles MacLean MBE", style: TextStyles.tabStyle.copyWith(fontSize: 16,fontWeight: FontWeight.w400)),
        const SizedBox(height: 10,),
        const TestingNoteWidget(title: "Notes",description: "Description",),
        const SizedBox(height: 10,),
        const TestingNoteWidget(title: "Palate",description: "Description",),
        const SizedBox(height: 10,),
        const TestingNoteWidget(title: "Finish",description: "Description",),


        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomText(text: "Your notes", style: TextStyles.tabStyle),
            CustomImageWidget.displayLocalImage("back_arrow.png",width: 24,height: 24,radius: 0)

          ],
        ),
        const SizedBox(height: 10,),
        const TestingNoteWidget(title: "Notes",description: "Description",),
        const SizedBox(height: 10,),
        const TestingNoteWidget(title: "Palate",description: "Description",),
        const SizedBox(height: 10,),
        const TestingNoteWidget(title: "Finish",description: "Description",),
      ],
    );
  }
}
