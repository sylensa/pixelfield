
import 'package:flutter/material.dart';
import 'package:pixelfield/features/screens/widgets/product_details_section_widget.dart';

class DetailsProduct extends StatelessWidget {
  const DetailsProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        ProductDetailsSectionWidget(
          title: 'Distillery',
          content: 'Text',
        ),
        ProductDetailsSectionWidget(
          title: 'Region',
          content: 'Text',
        ),
        ProductDetailsSectionWidget(
          title: 'Country',
          content: 'Text',
        ),
        ProductDetailsSectionWidget(
          title: 'Type',
          content: 'Text',
        ),
        ProductDetailsSectionWidget(
          title: 'Age statement',
          content: 'Text',
        ),
        ProductDetailsSectionWidget(
          title: 'Filled',
          content: 'Text',
        ),
        ProductDetailsSectionWidget(
          title: 'Bottled',
          content: 'Text',
        ),
        ProductDetailsSectionWidget(
          title: 'Cask number',
          content: 'Text',
        ),
        ProductDetailsSectionWidget(
          title: 'ABV',
          content: 'Text',
        ),
        ProductDetailsSectionWidget(
          title: 'Size',
          content: 'Text',
        ),
        ProductDetailsSectionWidget(
          title: 'Finish',
          content: 'Text',
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
