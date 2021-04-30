import 'package:flutter/material.dart';

import 'asnavigationdrawer.dart';
import 'page1.dart';
import 'page2.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NavigationDrawer Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: AsNavigationDrawer(drawerItems(), drawerPages(),
          drawerHeader: drawerHeader()),
    );
  }
}

List<DrawerItem> drawerItems() {
  return [
    new DrawerItem("Profile", Icons.person_outline),
    new DrawerItem("Settings", Icons.settings),
  ];
}

List<StatelessWidget> drawerPages() {
  return [
    new Page1(),
    new Page2(),
  ];
}

drawerHeader() {
  return DrawerHeader(
    child: Text(
      'Sample Drawer',
      style: TextStyle(color: Colors.white),
    ),
    decoration: BoxDecoration(
      color: Colors.blue,
    ),
  );
}
