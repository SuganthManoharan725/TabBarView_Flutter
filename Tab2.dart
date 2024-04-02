import 'dart:ui';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class Tab2 extends StatefulWidget {
  _Tab2State createState() => _Tab2State();
}

class _Tab2State extends State<Tab2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        child: ElevatedButton(
          child: Text('PAGE 3', style: TextStyle(color: Colors.black)),
          onPressed: () {
            setState(() {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Page3()));
            });
          },
        ),
      ),
    ));
  }
}

class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  List<dynamic> _data = [];

  @override
  void initState() {
    super.initState();
    _loadJsonData();
  }

  Future<void> _loadJsonData() async {
    final String jsonString =
        await rootBundle.loadString('lib/assets/data.json');
    setState(() {
      _data = json.decode(jsonString);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PAGE 3',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.cancel),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
        backgroundColor: Color(0xff0c0c0c),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (context, index) {
          final item = _data[index];
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                padding: EdgeInsets.all(10.0), // Adjust padding as needed
                decoration: BoxDecoration(
                  color: Color(0xff6fb7f1),
                  borderRadius: BorderRadius.circular(
                      5.0), // Adjust border radius as needed
                ),
                child: Center(
                  child: ListTile(
                      title: Center(
                          child: Text(
                    item['name'],
                    style: TextStyle(
                      color: Colors.black, // Text colour
                      fontSize: 16.0, // Text size
                      fontWeight: FontWeight.bold,
                    ),
                  ))),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
