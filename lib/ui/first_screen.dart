import 'package:flutter/material.dart';
import 'package:lab01/ui/detail_screen.dart';
//สำหรับ date time
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
//สำหรับ image
import 'package:image_picker/image_picker.dart';
import 'dart:io';

//ทำ drop down ใช้ stateful
class FirstScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstScreenState();
  }
}

class FirstScreenState extends State<FirstScreen> {
  // สำหรับ drop down
  List<String> _passengers = <String>["", "1", "2", "3", "4", "5"];
  String _passenger = "1";

  //สำหรับ image picker
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera),
        onPressed: (){
          getImage();
        },
      ),
      appBar: AppBar(
        title: Text("Frist Screen"),
      ),
      body: Column(
        children: <Widget>[
          _image == null ? Text("No image select") : Image.file(_image),
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
          ),
          DateTimePickerFormField(
            format: DateFormat("yyyy-MM-dd"),
            inputType: InputType.date,
            decoration: InputDecoration(labelText: "Datetime"),
          )
        ],
      ),
    );
  }
}
