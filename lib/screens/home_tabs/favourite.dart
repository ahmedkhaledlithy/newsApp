import 'dart:math';
import 'package:flutter/material.dart';

class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  List<Color> colorsList = [
    Colors.red,
    Colors.teal,
    Colors.black,
    Colors.yellow,
    Colors.blue,
    Colors.purple,
    Colors.deepOrange,
    Colors.brown,
    Colors.indigo
  ];

  Random random = Random();

  Color _getColorRandom() {
    return colorsList[random.nextInt(colorsList.length)];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        return Card(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                _AuthorRow(),
                SizedBox(
                  height: 16,
                ),
                _NewsItemRow(),
              ],
            ),
          ),
        );
      },
      itemCount: 20,
    );
  }

  Widget _AuthorRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage("assets/images/bg.png"),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
              ),
              width: 40,
              height: 40,
              margin: EdgeInsets.only(right: 16),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Michaele Adams",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "15 Miunte . ",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "Life style",
                      style: TextStyle(color: _getColorRandom()),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        IconButton(
          icon: Icon(
            Icons.bookmark_border,
            color: Colors.grey,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _NewsItemRow() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage("assets/images/night.png"),
                fit: BoxFit.cover,
              ),
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
                Text("Texh Tent : Old Phones and safe social",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "we also talk about the future of work as the robots advance , and we ask whether a retro phone",
                    style: TextStyle(color: Colors.grey,fontSize: 16,height: 1.3),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
