import 'package:flutter/material.dart';
import 'package:flutter_newsapp_api/shared_ui/navigation_drawer.dart';

class instgramFeedScreen extends StatefulWidget {
  @override
  _instgramFeedScreenState createState() => _instgramFeedScreenState();
}

class _instgramFeedScreenState extends State<instgramFeedScreen> {
  List<int> id = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("instagram Feeds"),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => {},
          ),
        ],
      ),
      drawer: NavigationDrawer(),
      body: ListView.builder(
        padding: EdgeInsets.all(9),
        itemBuilder: (context, position) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _drawHeader(position),
                  _drawDescription(),
                  _drawHashTags(),
                  _drawImage(),
                  _drawFooter(),

                  //   _cardFooter(),
                ],
              ),
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }

  Widget _drawHeader(int position) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: CircleAvatar(
                backgroundImage: ExactAssetImage("assets/images/bg2.png"),
                radius: 24,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Christina Meryers",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade900,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Fri, 12 May 2017 . 14.30",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.favorite),
                color:(id.contains(position))? Colors.red :Colors.grey.shade400,
                onPressed: () {
                  setState(() {
                    if(id.contains(position))
                    {
                      id.remove(position);
                    }
                    else
                    {
                      id.add(position);
                    }
                  });
                }),
            Transform.translate(
              child: Text(
                "25",
                style: TextStyle(color: Colors.grey.shade400, fontSize: 16),
              ),
              offset: Offset(-10, 0),
            ),
          ],
        ),
      ],
    );
  }

  Widget _drawDescription() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Text(
        "We Also Talk About the Future of Work as the robots",
        style: TextStyle(height: 1.5, fontSize: 15),
      ),
    );
  }

  Widget _drawHashTags() {
    return Container(
      child: Wrap(
        children: <Widget>[
          FlatButton(
              onPressed: () {},
              child: Text(
                "#advance",
                style: TextStyle(color: Colors.orange),
              )),
          FlatButton(
              onPressed: () {},
              child: Text(
                "#retro",
                style: TextStyle(color: Colors.orange),
              )),
          FlatButton(
              onPressed: () {},
              child: Text(
                "#instgram",
                style: TextStyle(color: Colors.orange),
              )),
        ],
      ),
    );
  }

  Widget _drawImage() {
    return SizedBox(
        child: Image(
          image: ExactAssetImage("assets/images/night.png"),
          fit: BoxFit.cover,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.3);
  }

  Widget _drawFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            FlatButton(
              onPressed: () {},
              child:
                  Text("10 COMMENTS", style: TextStyle(color: Colors.orange)),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            FlatButton(
              onPressed: () {},
              child: Text("SHARE", style: TextStyle(color: Colors.orange)),
            ),
            FlatButton(
              onPressed: () {},
              child: Text("OPEN", style: TextStyle(color: Colors.orange)),
            ),
          ],
        ),
      ],
    );
  }
}
