import 'package:flutter/material.dart';
import 'package:lab01/ui/detail_screen.dart';

//ทำ drop down ใช้ stateful
class FirstScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstScreenState();
  }
}

class FirstScreenState extends State<FirstScreen> {
  List<String> _passengers = <String>["", "1", "2", "3", "4", "5"];
  String _passenger = "1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frist Screen"),
      ),
      body: Column(
        children: <Widget>[
          InputDecorator(
            decoration: InputDecoration(
                icon: Icon(Icons.people), labelText: "passenger"),
            isEmpty: _passenger == "", //แก้ปัญหาเรื่อง label กับ value ทับกัน
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                value: _passenger, //เลือกค่าที่จะโชว์เป็นค่าแรก
                isDense: true, // ทำให้มันบีบให้สวยงาม
                onChanged: (String value) {},
                items: _passengers.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
