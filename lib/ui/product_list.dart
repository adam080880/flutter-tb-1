import 'package:flutter/material.dart';
import 'package:tb_1/ui/product_form.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  _handlePressAdd () {
    return () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const ProductForm()
      ));
    };
  }

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Produk')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: (
                Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 4),
                            child: const Text('Nama Produk: Produk 1'),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 4),
                            child: const Text('Harga: Rp. 5.000'),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 0),
                            child: const Text('Stok: 100'),
                          ),
                        ],
                      )
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 0),
                          child: IconButton(icon: const Icon(Icons.edit, color: Colors.amber), onPressed: () {}, iconSize: 24, padding: const EdgeInsets.all(3))
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 0),
                          child: IconButton(icon: const Icon(Icons.delete, color: Colors.redAccent), onPressed: () {}, iconSize: 24, padding: const EdgeInsets.all(3))
                        ),
                      ],
                    )
                  ]
                )
              )
            ),
            Card(
              child: (
                Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 4),
                            child: const Text('Nama Produk: Dedek Bebek'),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 4),
                            child: const Text('Harga: Rp. 10.000'),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 0),
                            child: const Text('Stok: 50'),
                          ),
                        ],
                      )
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 0),
                          child: IconButton(icon: const Icon(Icons.edit, color: Colors.amber), onPressed: () {}, iconSize: 24, padding: const EdgeInsets.all(3))
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 0),
                          child: IconButton(icon: const Icon(Icons.delete, color: Colors.redAccent), onPressed: () {}, iconSize: 24, padding: const EdgeInsets.all(3))
                        ),
                      ],
                    )
                  ]
                )
              )
            ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _handlePressAdd(),
        child: const Icon(Icons.add),
      ),
    );
  }
}