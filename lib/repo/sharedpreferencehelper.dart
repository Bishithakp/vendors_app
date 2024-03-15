import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferncesHelper {

  setUserValue({required String value})async{
   final SharedPreferences prefs  = await SharedPreferences.getInstance();
    await prefs.setString('action', value);
       
  }
   Future<String>getUserValue()async{
   final SharedPreferences prefs  = await SharedPreferences.getInstance();
    final String? action = prefs.getString('action');
       return action??'';
  }


}