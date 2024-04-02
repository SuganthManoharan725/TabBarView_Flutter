import 'package:flutter/material.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class Tab1 extends StatefulWidget {
  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        child: ElevatedButton(
          child: Text('PAGE 2', style: TextStyle(color: Colors.black)),
          onPressed: () {
            setState(() {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Page2()));
            });
          },
        ),
      ),
    ));
  }
}

class Page2 extends StatefulWidget {
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> with SingleTickerProviderStateMixin {
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

  void _goToPage3() {
    setState(() {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => Page3())); // Switch to Tab 2
    });
  }

  void _handleTabChange() {
    setState(() {});
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'PAGE 2',
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back), // Change the icon to a simple "<"
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.white,
          ),
          backgroundColor: Color(0xff070707),
          centerTitle: true,
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200], // Background colour of the tab bar
            borderRadius:
                BorderRadius.circular(10.0), // Adjust border radius as needed
          ),
          child: TabBar(
            indicator: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(10.0), // Adjust border radius as needed
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
                    width: double
                        .infinity, // Make the container fill the tab space
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
                    width: double
                        .infinity, // Make the container fill the tab space
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
                    width: double
                        .infinity, // Make the container fill the tab space
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
        body: Center(
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
      ),
    );
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
          icon: Icon(Icons.arrow_back),
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
          return Padding(
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
          );
        },
      ),
    );
  }
}
