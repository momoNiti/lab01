import 'package:flutter/material.dart';
import 'package:lab01/ui/first_screen.dart';
import 'package:lab01/ui/list_data.dart';
import 'package:lab01/ui/second_screen.dart';
import 'package:lab01/ui/my_custom_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // debugShowCheckedModeBanner: false, //show bar debug
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      // home: MyHomePage(),
      initialRoute: "/second",
      routes:{
        "/" :(context) => MyCustomForm(),
        "/second":(context) => SecondScreen(),
        "/first" : (context) => FirstScreen(),
        "/load" :(context) => ListData(),
        },
    );
  }
}
// วิธีการรันผ่าน cmd
// flutter emulators จะได้ ชื่อ device มา จากนั้นก็ flutter emulators --launch ตามด้วยชื่อ device ที่โชว์
// พอจะรันโค้ดก็ flutter run

//Stateless รัน widget ทีเดียวเลิก ใช้ memory น้อยกว่า
// Statefull เก็บข้อมูล และมีการ notified ด้วย ถ้าจะเขียนต้องมีสองคลาส

//ลองใชเ stateless ทำปุ่มบวกเลข ที่เลขไม่เพิ่มเพราะมันเป็น stateless
// class MyHomePage extends StatelessWidget {
//   int counter = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Hello Wold : title"),
//       ), // AppBar เป็นส่วนหัว
//       body: Text("Counter = ${counter} "),
//       floatingActionButton: IconButton(
//         icon: Icon(Icons.add),
//         onPressed: () {
//           counter++;
//           print("counter value = ${counter}");
//         },
//       ),
//     ); //scaffold คือ widget พร้อมใช้
//   }
// }

// ลองใช้ statful สร้างปุ่มกดดได้
// class MyHomePage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return MyHomePageState(); // create state ให้ส่งไปทื class state ตัวลูก
//   }
// }
// class MyHomePageState extends State<MyHomePage> {
//   //ตอน extends ให้ reference class แม่
//   int counter = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Hello Wold : title"),
//       ), // AppBar เป็นส่วนหัว
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround, //mainAxis จัดในแนวแกน X
//         crossAxisAlignment: CrossAxisAlignment.center, //crossAxis จัดนในแนวแกน Y
//         children: <Widget>[
//           Text("Counter = ${counter}"),
//           Text("Test row2"),
//           Text("Text row3"),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add), //.add คือเป็น + ไปดู icon อื่นๆได้ใน material icon
//         onPressed: () {
//           setState(() {
//             //Stateful ต้อง set state value ที่เราจะต้องเปลี่ยนแปลง
//             counter++;
//           });
//           print("counter value = ${counter}");
//         },
//       ),
//     ); //scaffold
//   }
// }

// ทำ tabbar
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Title tabbar"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.add),
                text: "add",
              ),
              Tab(
                icon: Icon(Icons.alarm),
                text: "alarm",
              ),
              Tab(
                icon: Icon(Icons.build),
                text: "build",
              ),
              Tab(
                icon: Icon(Icons.brush),
                text: "Brush",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Icon(Icons.add),
            Icon(Icons.access_alarms),
            Icon(Icons.build),
            Icon(Icons.brush),
          ],
        ),
      ),
    );
  }
}