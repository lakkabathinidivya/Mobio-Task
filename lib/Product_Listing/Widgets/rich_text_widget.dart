import 'package:flutter/material.dart';
import 'package:mobio_task/Product_Listing/Widgets/CustomTextStyle.dart';

class RichTextWidget extends StatelessWidget {
  String text1;
  String text2;

  RichTextWidget({required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text1,
        style: body2_14ptRegular(),
        children: <TextSpan>[
          TextSpan(text: text2, style: body2_14ptBold()),
        ],
      ),
    );
  }
}
