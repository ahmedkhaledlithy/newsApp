import 'package:shared_preferences/shared_preferences.dart';


Future<bool> isloggedin() async{
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  bool isloggedin=sharedPreferences.getBool("islogged");

  if(isloggedin==null||isloggedin==false)
    {
      return false;
    }
  return true;
}