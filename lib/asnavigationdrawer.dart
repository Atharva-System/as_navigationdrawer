import 'package:flutter/material.dart';

class DrawerItem {
  String title;
  IconData icon;

  DrawerItem(this.title, this.icon);
}

class AsNavigationDrawer extends StatefulWidget {
  final List<DrawerItem> drawerItems;
  final List<StatelessWidget> drawerPages;
  DrawerHeader drawerHeader;

  AsNavigationDrawer(this.drawerItems, this.drawerPages, {this.drawerHeader});

  @override
  _AsNavigationDrawerState createState() => _AsNavigationDrawerState();
}

class _AsNavigationDrawerState extends State<AsNavigationDrawer> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    return widget.drawerPages[pos];
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  defaultDrawerHeader() {
    return DrawerHeader(
      child: Text(
        'Drawer Header',
        style: TextStyle(color: Colors.white),
      ),
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(new ListTile(
        leading: new Icon(d.icon),
        title: new Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: new Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            widget.drawerHeader ?? defaultDrawerHeader(),
            new Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}
