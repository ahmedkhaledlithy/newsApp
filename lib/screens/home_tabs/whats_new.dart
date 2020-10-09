import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_newsapp_api/api/posts_api.dart';
import 'package:flutter_newsapp_api/models/post_model.dart';
import 'package:flutter_newsapp_api/screens/single_post.dart';
import 'package:flutter_newsapp_api/utilities/data_utilities.dart';
import 'package:http/http.dart';

class WhatsNew extends StatefulWidget {
  @override
  _WhatsNewState createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  PostAPI postAPI = PostAPI();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _drawHeader(),
          _drawTopStories(),
          _drawRecentUpdates(),
        ],
      ),
    );
  }

  Widget _drawHeader() {
    return FutureBuilder(
      future: postAPI.FetchAllwhatsnew(),
      builder: (context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
            return loading();
            break;

          case ConnectionState.waiting:
            return loading();
            break;

          case ConnectionState.none:
            return ConnectioError();
            break;

          case ConnectionState.done:
            if (snapshot.hasError) {
              return error(snapshot.error);
            }
            else {
              List<Post> posts = snapshot.data;
              Random random = Random();
              int rndindex = random.nextInt(posts.length);
              Post post = posts[rndindex];

              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SinglePost(post);
                  }));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(post.urlimage), fit: BoxFit.cover
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 48, right: 48),
                          child: Text(
                            post.source.id??'A non-null String must be provided to a Text widget.',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 34, right: 34),
                          child: Text(
                            post.content.substring(0,100)??'A non-null String must be provided to a Text widget.',
                            style: TextStyle(color: Colors.white, fontSize: 17),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            break;
        }
      },
    );
  }

  Widget _drawTopStories() {
    return Container(
      color: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16),
            child: _displayTitles("Top Stories"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              child: FutureBuilder(
                future: postAPI.FetchAllwhatsnew(),
                builder: (context, AsyncSnapshot snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return loading();
                      break;
                    case ConnectionState.active:
                      return loading();
                      break;

                    case ConnectionState.none:
                      return ConnectioError();
                      break;

                    case ConnectionState.done:
                      if (snapshot.error != null) {
                        return error(snapshot.error);
                      } else {
                        if (snapshot.hasData != null) {
                          List<Post> posts = snapshot.data;
                          if (posts.length >= 3) {
                            Post post1 = snapshot.data[0];
                            Post post2 = snapshot.data[1];
                            Post post3 = snapshot.data[2];

                            return Column(
                              children: <Widget>[
                                _drawSingleCard(post1),
                                _drawLine(),
                                _drawSingleCard(post2),
                                _drawLine(),
                                _drawSingleCard(post3),
                              ],
                            );
                          } else {
                            return noData();
                          }
                        } else {
                          return noData();
                        }
                      }
                      break;
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawRecentUpdates() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: FutureBuilder(
        future: postAPI.FetchAllRecentUpdates(),
        builder: (context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              return loading();
              break;

            case ConnectionState.waiting:
              return loading();
              break;

            case ConnectionState.none:
              return ConnectioError();
              break;

            case ConnectionState.done:
              if (snapshot.hasError) {
                return error(snapshot.error);
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 12, top: 8, bottom: 8),
                      child: _displayTitles("Recent Updates"??'A non-null String must be provided to a Text widget.'),
                    ),
                    _drawRecentUpdateCard(
                        Colors.red, "SPORT", snapshot.data[0]),
                    _drawRecentUpdateCard(
                        Colors.teal, "LifeStyle", snapshot.data[1]),
                    SizedBox(
                      height: 48,
                    ),
                  ],
                );
              }
              break;
          }
        },
      ),
    );
  }

  Widget _drawSingleCard(Post post) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return SinglePost(post);
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            SizedBox(
              child: Image.network(
                post.urlimage,
                fit: BoxFit.cover,
              ),
              width: 120,
              height: 120,
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    post.title,
                    maxLines: 2,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(post.author),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.alarm,
                          ),
                          Text(parseHumanDateTime(post.publishat)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawLine() {
    return Container(
      height: 1,
      width: double.infinity,
      color: Colors.grey.shade200,
    );
  }

  Widget _displayTitles(String title) {
    return Text(
      title,
      style: TextStyle(
          color: Colors.grey.shade700,
          fontSize: 16,
          fontWeight: FontWeight.w600),
    );
  }

  Widget _drawRecentUpdateCard(Color color, String name, Post post) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return SinglePost(post);
        }));
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              child: Image(
                image: NetworkImage(post.urlimage),
                fit: BoxFit.cover,
              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 12),
              child: Container(
                padding: EdgeInsets.only(left: 24, right: 24, top: 3, bottom: 3),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 8, left: 12),
              child: Text(
                post.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 16, top: 8),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.alarm,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    parseHumanDateTime(post.publishat),
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
