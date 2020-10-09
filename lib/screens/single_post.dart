import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_newsapp_api/models/post_model.dart';

class SinglePost extends StatefulWidget {
  final Post post;

  SinglePost(this.post);

  @override
  _SinglePostState createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.post.urlimage),
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {

              if (index == 0) {
                return _drawPstDetails();
              }
              else if(index==1)
                {
                  return _title();
                }
              else if (index >= 2 && index < 25) {
                return _Comments();
              } else {
                return _commentsTextEntry();
              }

            }, childCount: 26),
          ),
        ],
      ),
    );
  }

  Color getRandomColor({int minBrightness = 50}) {
    Random random = Random();
    assert(minBrightness >= 0 && minBrightness <= 255);
    return Color.fromARGB(
      0xFF,
      minBrightness + random.nextInt(255 - minBrightness),
      minBrightness + random.nextInt(255 - minBrightness),
      minBrightness + random.nextInt(255 - minBrightness),
    );
  }

  Widget _drawPstDetails() {
    return Column(
      children: <Widget>[
         Padding(
           padding: const EdgeInsets.all(16),
           child: Text(
            widget.post.content,
            style: TextStyle(fontSize: 18, height: 1.3, letterSpacing: 1.1),
        ),
         ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }



  Widget _Comments() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: ExactAssetImage("assets/images/night.png"),
              ),
              SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Christian"),
                  SizedBox(
                    height: 4,
                  ),
                  Text("1 hour"),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "weasel the jeeper goodness inconsiderately spelled so ubiquitous amused kinnted and alturrued amiable",
            style: TextStyle(height: 1.3),
          ),
        ],
      ),
    );
  }

  Widget _commentsTextEntry() {
    return Container(
   color: Colors.grey.shade300,
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "please Input Your Comment",
                contentPadding: EdgeInsets.only(left: 16)
              ),
            ),
          ),
          FlatButton(
            child: Text("Send",style: TextStyle(color: Colors.red.shade700),),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _title() {
   return Padding(
      padding: const EdgeInsets.only(bottom: 20,top: 20,left: 16),
      child: Row(
        children:<Widget>[
          Text("Comments (25)", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}
