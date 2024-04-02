import 'package:flutter/material.dart';
import 'package:helloworld/Tabs/Tab2.dart';

class Tab3 extends StatefulWidget {
  final VoidCallback goToTab2;

  Tab3({required this.goToTab2});

  _Tab3State createState() => _Tab3State();
}

class _Tab3State extends State<Tab3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        child: ElevatedButton(
          child: Text('TAB 2', style: TextStyle(color: Colors.black)),
          onPressed: () {
            setState(() {
              widget.goToTab2();
            });
          },
        ),
      ),
    ));
  }
}
