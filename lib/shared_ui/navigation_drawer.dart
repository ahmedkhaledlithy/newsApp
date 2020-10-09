import 'package:flutter/material.dart';
import 'package:flutter_newsapp_api/models/nav_model.dart';
import 'package:flutter_newsapp_api/screens/home_screen.dart';
import 'package:flutter_newsapp_api/screens/headline_screen.dart';
import 'package:flutter_newsapp_api/screens/twitter_feed_screen.dart';
import 'package:flutter_newsapp_api/screens/instgram_feed_screen.dart';
import 'package:flutter_newsapp_api/screens/facebook_feed_screen.dart';
import 'package:flutter_newsapp_api/utilities/login_logout_utilities.dart';
import 'package:flutter_newsapp_api/screens/login_screen.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {

    bool isloggedin=false;

  List<NavMenuItem>navigationMenu=[
    NavMenuItem("Explore", ()=>HomeScreen()),
    NavMenuItem("HeadLine News", ()=>HeadLineScreen()),
    NavMenuItem("Twitter Feeds", ()=>TwitterScreen()),
    NavMenuItem("instagram Feeds", ()=>instgramFeedScreen()),
    NavMenuItem("FaceBook Feeds", ()=>FaceBookFeedScreen()),
    NavMenuItem("LOGIN", ()=>Login()),
    
  ];
  
  @override
  void initState() {
    super.initState();
    if(isloggedin)
      {
        navigationMenu.add(NavMenuItem("Logout", ()=>FaceBookFeedScreen()));
      }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 75, left: 20),
        child: ListView.builder(
          itemBuilder: (context, position) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                  navigationMenu[position].title,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 22,
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.grey.shade400,
                ),
                onTap: () {
                  Navigator.pop(context);
                   Navigator.push(context, MaterialPageRoute(builder: (context){
                      return navigationMenu[position].destination();
                   },),
                   );
                },
              ),
            );
          },
          itemCount: navigationMenu.length,
        ),
      ),
    );
  }
}
