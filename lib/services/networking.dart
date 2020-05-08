import 'package:http/http.dart';
import 'dart:convert';
class Networking{
  String url;

  Networking(this.url);

  Future getdata() async{
    Response response = await get(url);
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      return data;
    }
    else{
      print(response.statusCode);
    }
}
}