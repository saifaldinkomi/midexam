import 'package:flutter/material.dart';
import 'package:test_lab_2/detailsPage.dart';
import 'package:test_lab_2/invoice.dart';

class AllInvoicesPage extends StatelessWidget {
  final List<Invoice> invoices;
  const AllInvoicesPage({super.key, required this.invoices});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("All Customers")),
      body: ListView.builder(
        itemCount: invoices.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Detailspage(invoice: invoices[index]),
              ),
            ),
            child: Card(
              elevation: 4,
              color: const Color.fromARGB(255, 88, 168, 234),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  invoices[index].Name,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
