import 'package:flutter/material.dart';
import 'package:lab01/ui/detail_screen.dart';

//ทำ drop down ใช้ stateful
class FirstScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return FirstScreenState();
  }
  
}
class FirstScreenState extends State<FirstScreen>{
  List<String> _passengers = <String>["", "1", "2", "3", "4", "5"];
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
              icon: Icon(Icons.people),
              labelText: "passenger"
            ),
            isEmpty: true,
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                onChanged: (String value) {
                  
                },
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