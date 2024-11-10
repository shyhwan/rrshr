import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _response = '';

  Future<void> fetchHelloMessage() async {
    final url = Uri.parse('http://localhost:8081/api/hello');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          _response = response.body;
        });
      } else {
        setState(() {
          _response = 'Error: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _response = 'Failed to connect to the server';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchHelloMessage();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter & Spring Boot'),
        ),
        body: Center(
          child: Text(_response),
        ),
      ),
    );
  }
}
