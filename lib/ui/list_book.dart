import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListBook extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return StreamBuilder(
      stream: Firestore.instance.collection('books').snapshots(),
      builder: (context, snapshort){
        if(snapshort.hasData){
          // create list comnponent
          return ListView.builder(
            itemCount: snapshort.data.size,
            itemBuilder: (context, index){
              return ListTile(
                title: snapshort.data[index]['title'],
                subtitle: snapshort.data[index]['author'],
              );
            },
          );
        }
        else{
          return CircularProgressIndicator();
        }
      },
    );
  }

}