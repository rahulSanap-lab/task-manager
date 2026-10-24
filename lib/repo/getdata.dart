import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:taskmanager/modal/todo_Modal.dart';

class getuserData {


  // get api
  Future<List<Addtask>> getdata() async {
    final response = await http.get(
      Uri.parse("https://6ad8b33ff89c5702ed9a031e.mockapi.io/todolist"),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      return data.map((json) => Addtask.fromJson(json)).toList();
    } else {
      throw Exception("failed to load post");
    }
  }

  //  post api

  Future postdata(String title) async{
    final response = await http.post(Uri.parse("https://6ad8b33ff89c5702ed9a031e.mockapi.io/todolist"),
    headers :{'Content-Type' : 'application/json' } ,
    body:  jsonEncode({'title':title}) ) ;

    if(response.statusCode == 201){
      print("task added") ;
    }

    else {
      print("error");
    }

    
  }
}
