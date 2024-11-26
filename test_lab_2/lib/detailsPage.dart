// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:test_lab_2/invoice.dart';


class Detailspage extends StatelessWidget {
 final Invoice invoice;
  const Detailspage({
    Key? key,
    required this.invoice,
  }) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${invoice.Name}"),
      ),
      body: Text("${invoice.toString()}"),
    
    );
  }
}
