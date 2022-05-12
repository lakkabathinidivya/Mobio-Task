import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobio_task/Product_Listing/Widgets/CustomTextStyle.dart';
import 'package:mobio_task/Product_Listing/models/product_list_model.dart';
import 'package:intl/intl.dart';
import '../Widgets/rich_text_widget.dart';
import '../controller/product_list_controller.dart';

class OrderSummary extends StatelessWidget {
  final ProductController _productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.deepPurpleAccent,
            centerTitle: true,
            title: Text('Order Summary')),
        body: ListView.builder(
            itemCount: _productController.allProducts.length,
            itemBuilder: (ctx, index) {
              return _item(_productController.allProducts[index],
                  _productController.itemQuanity[index].text);
            }));
  }

  Widget _item(ProductList item, String qty) {
    NumberFormat format = NumberFormat.simpleCurrency();
    var newPrice = item.price.replaceAll("\$", "").replaceAll(',', '');
    double totalPrice = int.parse(qty) * double.parse(newPrice);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: CircleAvatar(
                backgroundColor: Colors.grey.shade200,
                radius: 30,
                backgroundImage: NetworkImage(item.picture),
              ),
            ),
            Container(
              height: 130,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.productName,
                      style: body1_16ptMedium(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichTextWidget(
                          text1: 'Quanity: ',
                          text2: '${qty}',
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        RichTextWidget(
                          text1: 'Price: ',
                          text2: item.price,
                        ),
                      ],
                    ),
                    RichTextWidget(
                      text1: 'Selected Color: ',
                      text2: item.selectedColor ?? "",
                    ),
                    RichTextWidget(
                      text1: 'Selected Brand: ',
                      text2: item.selectedBrand!.name,
                    ),
                    RichTextWidget(
                        text1: 'Total Price: ',
                        text2: totalPrice.toStringAsFixed(2)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
