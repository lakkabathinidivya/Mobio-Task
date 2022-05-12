import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobio_task/Product_Listing/screens/order_summary.dart';

import '../Widgets/CustomTextStyle.dart';
import '../Widgets/dropDownWidget.dart';
import '../Widgets/list_item_widget.dart';

import '../Widgets/radio_button_widget.dart';
import '../Widgets/textField.dart';
import '../controller/product_list_controller.dart';

class ProductListing extends StatefulWidget {
  const ProductListing({Key? key}) : super(key: key);

  @override
  State<ProductListing> createState() => _ProductListingState();
}

class _ProductListingState extends State<ProductListing> {
  final ProductController _productController = Get.put(ProductController());

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _productController.getMethod();
    });

    // TODO: implement initState
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
            backgroundColor: Colors.deepPurpleAccent,
            centerTitle: true,
            title: const Text('Product Lists')),
        body: Obx(() {
          return SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: ListView.builder(
                        itemCount: _productController.allProducts.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListItemWidget(
                              _productController.allProducts[index],
                              _productController.itemQuanity[index]);
                        }),
                  ),
                  MaterialButton(
                    color: Colors.amber,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return OrderSummary();
                        }));
                      }
                    },
                    child: const Text('Submit Product'),
                  )
                ],
              ),
            ),
          );
        }));
  }
}
