import 'package:flutter/material.dart';
import 'package:flutter_newsapp_api/screens/home_tabs/favourite.dart';
import 'package:flutter_newsapp_api/screens/home_tabs/popular.dart';
import 'package:flutter_newsapp_api/screens/home_tabs/whats_new.dart';
import 'package:flutter_newsapp_api/shared_ui/navigation_drawer.dart';

class HeadLineScreen extends StatefulWidget {
  @override
  _HeadLineState createState() => _HeadLineState();
}

class _HeadLineState extends State<HeadLineScreen> with SingleTickerProviderStateMixin {

  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 0,length: 3, vsync: this);
  }

  //3lashan el memory fa btt5ls mn elhagat ely msh mhtagha
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Headline News"),
        centerTitle: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
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
          Favourites(),
          Popular(),
          Favourites(),

        ],controller: tabController,),
      ),
    );

  }
}
