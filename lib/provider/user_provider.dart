import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_web_demo/model/user__response.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier {
  UserResponse userResponse;
  List<UserResponse> userList = [];
  bool isLoading = false;
  String title = '';
  String subTitle = '';
  String imagePath = '';
  void setValue(String name, String des, String img){
    title = name;
    subTitle = des;
    imagePath = img;
    notifyListeners();
    
  }

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void stopLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future<List<UserResponse>> getUserDetail() async {
     List userList1;
    startLoading();
    try {
      final response = await http.get(
        Uri.parse(
            'https://run.mocky.io/v3/58f6a8d7-6afa-4c25-96b0-072f54a715ae'),
      );
    
      if (response.statusCode == 200) {
        print('getting');
        userList1=json.decode(response.body);
        stopLoading();
        notifyListeners();
      
      } else {
        print('else part');
        print('Something went wrong');
      }
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
    return userList1.map((e) => UserResponse.fromJson(e)).toList();
  }
}
