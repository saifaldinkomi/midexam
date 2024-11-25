import 'package:flutter/material.dart';
import 'package:test_lab/student.dart';

class Carts extends StatefulWidget {
  final Student;

  const Carts({
    super.key,
    this.Student,
  });

  @override
  State<Carts> createState() => _CartsState();
}

class _CartsState extends State<Carts> {
  @override
  Widget build(BuildContext context) {
    // create a new instance of the widget (card )
    //اضافة gesture
    //للشاشة المنبثقة ال
    //(dialog)
    //  لكي تظهر
    //ال gesture على ال card كلو
    return GestureDetector(
      onTap: () {
        //عند النقر على ال curd تظهر alert وتظهر المعلومات
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('${widget.Student.Name} details: '),
            content: Text(
                'Name: ${widget.Student.Name}\nId: ${widget.Student.Id}\nAddress: ${widget.Student.Address}\nPhone: ${widget.Student.Phone}'),
            actions: [
              //(action: )عند الضغط على (ok) يقوم باخفاء ال (alert)
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Done'))
            ],
          ),
        );
      },
      child: Container(
        height: 200,
        child: Card(
          shadowColor: Colors.amber,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Name: ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.Student.Name,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Id :",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(widget.Student.Id),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Image.asset(
                      widget.Student.image,
                      height: 80,
                      width: 80,
                    ),
                    IconButton(
                      //تحويل ال fun الى widget
                      // عند الضغط على ال button يقوم بتحويل قيمة teac
                      onPressed: () {
                        setState(() {
                          widget.Student.teac = !widget.Student.teac;
                        });
                      },
                      icon: Icon(widget.Student.teac
                          ? Icons.check_box_outlined
                          : Icons.check_box_outline_blank),
                    )
                  ],
                )
              ],
            ),
          ]),
        ),
      ),
    );
    // return the widget to the main app
  }
}
