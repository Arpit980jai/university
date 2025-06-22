import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:university/Model/universityModel.dart';


class UniversityService {
  
  Future<List<UniversityModel>> getUniversity(String Country)async{
    var url = Uri.parse("http://universities.hipolabs.com/search?country=$Country");

    final response = await http.get(url);

    if(response.statusCode==200)
  {
    print(response.body);
    List<dynamic> data = jsonDecode(response.body);
    List<UniversityModel> university = data.map((item)=>UniversityModel.fromJson(item)).toList();
    return university;
  }
    else{
      print("error");
      return [];
    }

  }
}