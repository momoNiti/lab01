import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Frist Screen"),
      ),
      body: Center(
        child: FlatButton(
          child: Text("Frist Screen"),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(title: "hello"),
              )
              
              );
          },
          ),
      ),
    );
  }
}