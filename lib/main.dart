import 'package:flutter/material.dart';
import 'package:search_app/SearchScreen.dart';
import 'source.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchScreen(),
    );
  }
}

Future<Map> getPics(String category) async{
  String api_url='https://pixabay.com/api/?key=$api_key&q=$category&image_type=photo&pretty=true';
  http.Response response = await http.get(api_url);
  return json.decode(response.body);
}
