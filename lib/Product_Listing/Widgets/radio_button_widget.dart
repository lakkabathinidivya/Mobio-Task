import 'package:flutter/material.dart';
import 'package:mobio_task/Product_Listing/models/product_list_model.dart';

class RadioWidget extends StatefulWidget {
  ProductList item;

  RadioWidget({
    required this.item,
  });

  @override
  State<RadioWidget> createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ...widget.item.colors.map((e) => getRadioBtn(e, widget.item)).toList()
      ],
    );
  }

  getRadioBtn(String color, ProductList item) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<String>(
            activeColor: item.selectedColor == 'Red'
                ? Colors.red
                : item.selectedColor == 'Blue'
                    ? Colors.blue
                    : Colors.green,
            value: color,
            groupValue: item.selectedColor,
            onChanged: (value) {
              item.selectedColor = value;
              setState(() {});
            }),
        Text(color),
      ],
    );
  }
}
