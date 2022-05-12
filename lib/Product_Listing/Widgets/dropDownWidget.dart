import 'package:flutter/material.dart';
import 'package:mobio_task/Product_Listing/Widgets/CustomTextStyle.dart';
import 'package:mobio_task/Product_Listing/models/product_list_model.dart';

class DropdownWidget extends StatefulWidget {
  final ProductList item;

  DropdownWidget({required this.item});

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.04,
      width: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      // width: double.infinity,

      child: DropdownButton<Brand>(
        value: widget.item.selectedBrand,
        underline: SizedBox(),
        isExpanded: true,
        icon: const Icon(Icons.keyboard_arrow_down),
        items: widget.item.brands.map((Brand brands) {
          return DropdownMenuItem(
            value: brands,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                brands.name,
                style: body2_14ptRegular(),
              ),
            ),
          );
        }).toList(),
        onChanged: (Brand? value) {
          widget.item.selectedBrand = value;
          setState(() {});
        },
      ),
    );
  }
}
