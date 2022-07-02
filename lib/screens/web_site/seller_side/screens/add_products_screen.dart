import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sidh_shop/utils/styles.dart';
import 'package:sidh_shop/widgets/customButton.dart';
import 'package:sidh_shop/widgets/custom_textField.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddProductScreen extends StatefulWidget {
  static const id = 'addproduct';
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController productNameC = TextEditingController();
  TextEditingController detailC = TextEditingController();
  TextEditingController priceC = TextEditingController();
  TextEditingController discountPriceC = TextEditingController();
  TextEditingController brandC = TextEditingController();
  TextEditingController serialCodeC = TextEditingController();
  // TextEditingController productNameC = TextEditingController();
  final ImagePicker imagePicker = ImagePicker();
  String? selectedValue;

  List<String> cateogories = [
    'Garments',
    'Shoes',
    'Grocery',
    'Medicine',
    'Home Appliances',
    'Gadegets',
  ];

  bool isOnSale = false;
  bool isPopular = false;
  bool isFavourite = false;
  List<XFile> images = [];

  getImages() async {
    final List<XFile>? pickImage = await imagePicker.pickMultiImage();
    if (imagePicker != null) {
      setState(() {
        images.addAll(pickImage!);
      });
    } else {
      print('no image selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                'ADD PRODUCT',
                style: AppStyle.h1,
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(17),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(10)),
                        hint: Text('Choose category'),
                        validator: (v) {
                          if (v == null) {
                            return 'Category must be selected';
                          }
                          return null;
                        },
                        // value: cateogories[0],
                        items: cateogories
                            .map(
                              (e) => DropdownMenuItem<String>(
                                  value: e, child: Text(e)),
                            )
                            .toList(),
                        onChanged: (v) {
                          setState(() {
                            selectedValue = v.toString();
                          });
                        },
                      ),
                    ),
                    CustomTextField(
                      controller: productNameC,
                      hintText: 'enter product name',
                      validation: (v) {
                        if (v!.isEmpty) {
                          return 'should not be empty';
                        }
                        return null;
                      },
                    ),
                    CustomTextField(
                      maxLine: 6,
                      controller: detailC,
                      hintText: 'enter product detail',
                      validation: (v) {
                        if (v!.isEmpty) {
                          return 'should not be empty';
                        }
                        return null;
                      },
                    ),
                    CustomTextField(
                      controller: priceC,
                      hintText: 'enter product price',
                      validation: (v) {
                        if (v!.isEmpty) {
                          return 'should not be empty';
                        }
                        return null;
                      },
                    ),
                    CustomTextField(
                      controller: discountPriceC,
                      hintText: 'enter product discount price',
                      validation: (v) {
                        if (v!.isEmpty) {
                          return 'should not be empty';
                        }
                        return null;
                      },
                    ),
                    CustomTextField(
                      controller: brandC,
                      hintText: 'enter product brand',
                      validation: (v) {
                        if (v!.isEmpty) {
                          return 'should not be empty';
                        }
                        return null;
                      },
                    ),
                    CustomTextField(
                      controller: serialCodeC,
                      hintText: 'enter product serialCode',
                      validation: (v) {
                        if (v!.isEmpty) {
                          return 'should not be empty';
                        }
                        return null;
                      },
                    ),
                    CustomButton(
                      title: 'pick images',
                      onPress: () {
                        getImages();
                      },
                    ),
                    Container(
                      margin: EdgeInsets.all(17),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                            itemCount: images.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 10,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemBuilder: (context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.network(
                                    File(images[index].path).path,
                                    height: 200,
                                    width: 200,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
