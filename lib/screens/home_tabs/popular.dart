import 'package:flutter/material.dart';
import 'package:flutter_newsapp_api/models/post_model.dart';
import 'package:flutter_newsapp_api/screens/single_post.dart';
import 'package:flutter_newsapp_api/utilities/data_utilities.dart';
import 'package:flutter_newsapp_api/api/posts_api.dart';

class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  PostAPI postAPI=PostAPI();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:postAPI.FetchPopular(),
      builder: (context,AsyncSnapshot snapshot){

        switch(snapshot.connectionState)
        {
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
            if(snapshot.hasError)
              {
                return error(snapshot.error);
              }
            else{

              List<Post>posts=snapshot.data;
              return ListView.builder(itemBuilder: (context,posision){
                return Card(
                  child: _drawSingleCard(posts[posision]),
                );
              },
                itemCount: posts.length,
              ) ;

            }
            break;

         }

      },
    );
  }
  Widget _drawSingleCard(Post post) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return SinglePost(post);
          }));
        },
        child: Row(
          children: <Widget>[
            SizedBox(
              child: Image(
                image: NetworkImage(post.urlimage),
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
                      Text(post.author.substring(0,10),),
                      Row(
                        children: <Widget>[
                          Icon(Icons.alarm),

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

}
