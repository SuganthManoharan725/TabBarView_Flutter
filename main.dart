import 'package:flutter/material.dart';
import 'package:helloworld/Tabs/Tab1.dart';
import 'package:helloworld/Tabs/Tab2.dart';
import 'package:helloworld/Tabs/Tab3.dart';

void main() => runApp(MaterialApp(home: MyDemo()));

class MyDemo extends StatefulWidget {
  _MyDemoState createState() => _MyDemoState();
}

class _MyDemoState extends State<MyDemo> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabChange);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    super.dispose();
  }

  void _goToTab2() {
    setState(() {
      _tabController.index = 1; // Switch to Tab 2
    });
  }

  void _handleTabChange() {
    setState(() {});
  }

  bool isButtonPressed = false;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PAGE 1',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          // Adjust colours and shape accordingly
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey[200], // Background colour of the tab bar
        ),
        child: TabBar(
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.black, // Colour of the selected tab indicator
          ),
          indicatorColor: Colors.transparent,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          controller: _tabController,
          tabs: [
            Tab(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width:
                      double.infinity, // Make the container fill the tab space
                  height: 40.0, // Adjust height as needed
                  child: Center(
                    child: Text(
                      'TAB 1',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            Tab(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width:
                      double.infinity, // Make the container fill the tab space
                  height: 40.0, // Adjust height as needed
                  child: Center(
                    child: Text(
                      'TAB 2',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            Tab(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width:
                      double.infinity, // Make the container fill the tab space
                  height: 40.0, // Adjust height as needed
                  child: Center(
                    child: Text(
                      'TAB 3',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Tab1(),
          Tab2(),
          Tab3(goToTab2: _goToTab2),
        ],
      ),
    );
  }
}
