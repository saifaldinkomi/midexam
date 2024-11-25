import 'package:flutter/material.dart';
import 'package:test_lab_2/allInvoices.dart';
import 'package:test_lab_2/invoice.dart';
import 'package:test_lab_2/product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InvoiceApp(),
    );
  }
}

class InvoiceApp extends StatefulWidget {
  const InvoiceApp({super.key});

  @override
  State<InvoiceApp> createState() => _InvoiceAppState();
}

TextEditingController cNameController = TextEditingController();
TextEditingController productControllerName = TextEditingController();
TextEditingController productControllerPrice = TextEditingController();
TextEditingController productControllerQuintity = TextEditingController();

List<Product> productList = [];
List<Invoice> invoicesList = [];

class _InvoiceAppState extends State<InvoiceApp> {
  static int invoiceCount = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("invoice#${invoiceCount}"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          TextField(
            controller: cNameController,
            decoration: InputDecoration(
              label: Text("Customer Name"),
              hintText: "Enter Customer Name",
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "product",
                  style: TextStyle(fontSize: 22, color: Colors.blue),
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          "Product info:",
                          style: TextStyle(fontSize: 20),
                        ),
                        content: SingleChildScrollView(
                          child: Column(
                            children: [
                              TextField(
                                controller: productControllerName,
                                decoration: InputDecoration(
                                  label: Text("Product Name"),
                                  hintText: "Enter Product Name",
                                ),
                              ),
                              TextField(
                                keyboardType: TextInputType.numberWithOptions(),
                                controller: productControllerQuintity,
                                decoration: InputDecoration(
                                  label: Text("Product Quintity"),
                                  hintText: "Enter Product Quintity",
                                ),
                              ),
                              TextField(
                                keyboardType: TextInputType.numberWithOptions(),
                                controller: productControllerPrice,
                                decoration: InputDecoration(
                                  label: Text("Product Price"),
                                  hintText: "Enter Product Price",
                                ),
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  Product productNew = Product(
                                      Name: productControllerName.text,
                                      Price: double.parse(
                                          productControllerPrice.text),
                                      Quantity: int.parse(
                                          productControllerQuintity.text));
                                  productList.add(productNew);
                                  productControllerName.clear();
                                  productControllerPrice.clear();
                                  productControllerQuintity.clear();
                                });
                                Navigator.of(context).pop();
                              },
                              child: Text("Add")),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {});
                                Navigator.of(context).pop();
                              },
                              child: Text("cansle"))
                        ],
                      ),
                    );
                  },
                  child: Text("Add Product"),
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: productList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  tileColor: Colors.blue,
                  leading: Text(productList[index].Name),
                  title: Text("Price: ${productList[index].Price.toString()}"),
                  subtitle: Text(
                      "Quintity: ${productList[index].Quantity.toString()}"),
                  trailing:
                      IconButton(onPressed: () {
                        setState(() {
                          productList.removeAt(index);
                        });
                      }, icon: Icon(Icons.delete)),
                ),
              );
            },
          )),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Invoice invoiceNew = Invoice(
                       Name: cNameController.text,
                       products: productList,
                      );
                      invoiceCount++;
                      invoicesList.add(invoiceNew);
                      productList=[];
                      cNameController.clear();
                    });
                  },
                  child: Text("Add invoice"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context, 
                    MaterialPageRoute(builder:(context)=>AllInvoicesPage(invoices:invoicesList) ));
                  },
                  child: Text("show all invoice"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
