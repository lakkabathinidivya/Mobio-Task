import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobio_task/Product_Listing/Widgets/radio_button_widget.dart';
import 'package:mobio_task/Product_Listing/Widgets/textField.dart';
import 'package:mobio_task/Product_Listing/models/product_list_model.dart';
import '../controller/product_list_controller.dart';
import 'CustomTextStyle.dart';
import 'dropDownWidget.dart';

class ListItemWidget extends StatefulWidget {
  final ProductList item;

  final TextEditingController controller;
  const ListItemWidget(this.item, this.controller, {Key? key})
      : super(key: key);
  @override
  State<ListItemWidget> createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  backgroundImage: NetworkImage(widget.item.picture),
                  radius: 30,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.productName,
                    style: body1_16ptMedium(),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'price: ${widget.item.price}',
                    style: body2_14ptMedium(),
                  ),
                  RadioWidget(item: widget.item),
                  DropdownWidget(
                    item: widget.item,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    controller: widget.controller,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
