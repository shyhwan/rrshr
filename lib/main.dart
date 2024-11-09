import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  var a = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Text(a.toString()),
          onPressed: (){
            print('테스트 브렌치 수정수정');
            print('테스트');
            a++;
          },
        ),
        appBar: AppBar(
          title: Text('Header'),
        ),
        body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, idx) {
            return ListTile(
            leading: Image.asset('spaceEye.jpg'),
            title: Text('data'),
            );
          },
        ),
      )
    );
  }
}
