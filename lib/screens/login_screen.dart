import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool isloading=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child:(isloading)?_loading():_drawLoginForm() ,
      ),
    );
  }

  Widget _drawLoginForm(){
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(hintText: "Enter Your Email", labelText: "User"),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter UserName';
              }
              return null;
            },

          ),
          SizedBox(
            height: 48,
          ),
          TextFormField(
            decoration: InputDecoration(hintText: "Enter Your Password", labelText: "Password"),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter Password';
              }
              return null;
            },
          ),
          SizedBox(
            height: 48,
          ),
          SizedBox(
            child: RaisedButton(
              onPressed: () {
                if( _formKey.currentState.validate())
                {
                  //call api
                     setState(() {
                       isloading=true;
                     });
                }
                else
                  {
                    setState(() {
                      isloading=false;
                    });
                  }
              },
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
            ),
            width: double.infinity,
          ),
        ],
      ),
    );
  }

  Widget _loading(){
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
