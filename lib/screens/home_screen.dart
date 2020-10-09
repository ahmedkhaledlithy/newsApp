import 'package:flutter/material.dart';
import 'package:flutter_newsapp_api/api/category.dart';
import 'package:flutter_newsapp_api/pages/about.dart';
import 'package:flutter_newsapp_api/pages/contact_us.dart';
import 'package:flutter_newsapp_api/pages/help.dart';
import 'package:flutter_newsapp_api/pages/settings.dart';
import 'package:flutter_newsapp_api/shared_ui/navigation_drawer.dart';
import 'home_tabs/whats_new.dart';
import 'home_tabs/popular.dart';
import 'home_tabs/favourite.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
enum Popupmenu{
HELP,ABOUT,CONTACT_US,SETTINGS
}
class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 0,length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Explore"),
        centerTitle: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          _Menu(context),
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              icon: Icon(Icons.update),
              text: "WHAT'S NEW",
            ),
            Tab(
              icon: Icon(Icons.comment),
              text: "POPULAR",
            ),
            Tab(
              icon: Icon(Icons.favorite),
              text: "FAVOURITES",
            ),

          ],
          controller: tabController,
        ),
      ),

      drawer: NavigationDrawer(),

      body: Center(
        child: TabBarView(children: [
          WhatsNew(),
          Popular(),
          Favourites(),

        ],controller: tabController,),
      ),
    );
  }

 Widget _Menu(BuildContext context) {
    return PopupMenuButton<Popupmenu>(itemBuilder: (context){

      return [
        PopupMenuItem<Popupmenu>(
          value: Popupmenu.ABOUT,
          child: Text('ABOUT'),
        ),
        PopupMenuItem<Popupmenu>(
          value: Popupmenu.HELP,
          child: Text('HELP'),
        ),
        PopupMenuItem<Popupmenu>(
          value: Popupmenu.CONTACT_US,
          child: Text('CONTACT_US'),
        ),
        PopupMenuItem<Popupmenu>(
          value: Popupmenu.SETTINGS,
          child: Text('SETTINGS'),
        ),

      ];
    },onSelected: (Popupmenu menu){
        switch(menu)
        {
          case Popupmenu.ABOUT:
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return AboutUs();
            }));
            break;

          case Popupmenu.HELP:
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return Help();
            }));
            break;

          case Popupmenu.CONTACT_US:
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return ContactUs();
            }));
            break;

          case Popupmenu.SETTINGS:
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return Settings();
            }));
            break;

        }
    },
    );
  }
}
