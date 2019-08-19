import 'package:flutter_web/cupertino.dart';
import 'package:flutter_web/material.dart';
import 'package:smartters_studio_admin_ui/pages/drawer_pages/blog_page.dart';
import 'package:smartters_studio_admin_ui/pages/drawer_pages/contact_page.dart';
import 'package:smartters_studio_admin_ui/pages/drawer_pages/gallery_page.dart';
import 'package:smartters_studio_admin_ui/pages/drawer_pages/home_page.dart';
import 'package:smartters_studio_admin_ui/pages/drawer_pages/projects_page.dart';
import 'package:smartters_studio_admin_ui/pages/drawer_pages/subscriber_page.dart';
import 'package:smartters_studio_admin_ui/pages/drawer_pages/team_page.dart';
import 'package:smartters_studio_admin_ui/pages/login_page.dart';
import 'package:smartters_studio_admin_ui/pojos/drawer_item.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  String _title = "Smartters' Studio";
  int selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return HomePage();
      case 1:
        return BlogPage();
      case 2:
        return TeamPage();
      case 3:
        return ProjectsPage();
      case 4:
        return GalleryPage();
      case 5:
        return ContactPage();
      case 6:
        return SubscriberPage();
      default:
        return HomePage();
    }
  }

  _onSelectItem(int index) {
    setState(() => selectedDrawerIndex = index);
    Navigator.of(context).pop();
  }

  final drawerItems = [
    DrawerItem("Home", Icons.home),
    DrawerItem("Blog", Icons.view_list),
    DrawerItem("Team", Icons.people),
    DrawerItem("Projects", Icons.work),
    DrawerItem("Gallery", Icons.photo_library),
    DrawerItem("Contact entries", Icons.contacts),
    DrawerItem("Subscribers", Icons.subscriptions),
  ];

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];

    for (var i = 0; i < drawerItems.length; i++) {
      var d = drawerItems[i];
      drawerOptions.add(
        ListTile(
            leading: Icon(d.icon),
            title: Text(d.title),
            selected: i == selectedDrawerIndex,
            onTap: () {
              _onSelectItem(i);
              _title = d.title;
            }),
      );
    }
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Are you sure to sign out?'),
                      contentPadding: EdgeInsets.all(20.0),
                      actions: <Widget>[
                        MaterialButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancel'),
                          textColor: Colors.white,
                          color: Theme.of(context).accentColor,
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                CupertinoPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          textColor: Colors.white,
                          child: Text('Ok'),
                          color: Theme.of(context).accentColor,
                        )
                      ],
                    );
                  });
            },
          ),
        ],
        elevation: 2.0,
        title: Text(selectedDrawerIndex == 0
            ? 'Smartters\' Studio'
            : 'Smartters\' Studio - $_title'),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              height: 150.0,
              color: Colors.blue.withOpacity(0.6),
            ),
            Column(
              children: drawerOptions,
            ),
          ],
        ),
      ),
      body: _getDrawerItemWidget(selectedDrawerIndex),
    );
  }
}
