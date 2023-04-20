import 'package:flutter/material.dart';
import 'package:tb_1/formatters/auto_upper_case.dart';
import 'package:tb_1/models/product.dart';

class ProductForm extends StatefulWidget {
  const ProductForm({Key? key}) : super(key: key);

  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _productCodeController = TextEditingController();
  final _productNameController = TextEditingController();
  final _productPriceController = TextEditingController();
  final _productStockController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: const Text('Form Produk')),
    body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Column(children: [
          _renderTextBoxProductCode(),
          _renderTextBoxProductName(),
          _renderTextBoxProductPrice(),
          _renderTextBoxProductStock(),
          _renderSaveButton(context),
        ])
      ),
    );
  }

  _renderTextBoxProductCode() {
    return TextField(
        decoration: const InputDecoration(
            hintText: 'Ex: DDKBBK01', labelText: 'Kode Produk'),
        controller: _productCodeController,
        inputFormatters: [AutoUpperCase()]);
  }

  _renderTextBoxProductName() {
    return TextField(
        decoration: const InputDecoration(
            hintText: 'Ex: Dedek bebek', labelText: 'Nama Produk'),
        controller: _productNameController);
  }

  _renderTextBoxProductPrice() {
    return TextField(
        decoration: const InputDecoration(
            hintText: 'Ex: 5000', labelText: 'Harga Produk'),
        keyboardType: TextInputType.number,
        controller: _productPriceController);
  }

  _renderTextBoxProductStock() {
    return TextField(
      decoration: const InputDecoration(
        hintText: 'Ex: 99', labelText: 'Stok Produk'),
      keyboardType: TextInputType.number,
      controller: _productStockController,
    );
  }

  _renderSaveButton(context) {
    return ElevatedButton(
        onPressed: _handleSaveButton(context), child: const Text('Simpan'));
  }

  _handleSaveButton(context) {
    return () {
      if (_productCodeController.text.isEmpty ||
          _productNameController.text.isEmpty ||
          _productPriceController.text.isEmpty ||
          _productStockController.text.isEmpty) {
        AlertDialog alert = AlertDialog(
            title: const Text('Input tidak valid'),
            content: const Text('Semuanya wajib diisi'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'))
            ]);

        showDialog(context: context, builder: (BuildContext context) => alert);

        return;
      }

      Product newProduct = Product();
      newProduct.productCode = _productCodeController.text;
      newProduct.productName = _productNameController.text;
      newProduct.productPrice = int.parse(_productPriceController.text);
      newProduct.productStock = int.parse(_productStockController.text);

      Navigator.of(context).pop();
    };
  }
}