import 'dart:io';

import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  String name;
  File? photo;
  String email;
  String phoneNumber;
  String password;

  User(this.name, this.photo, this.email, this.phoneNumber, this.password);

  void setPhoto(File? photo) {
    this.photo = photo;
    notifyListeners();
  }

  void setSignUpData(name, email, phoneNumber, password) {
    this.name = name;
    this.email = email;
    this.phoneNumber = phoneNumber;
    this.password = password;
    notifyListeners();
  }

  bool validadeLogin(email, password) {
    return email == this.email && password == this.password;
  }

  String srcDefaultPhoto() {
    return "https://as1.ftcdn.net/v2/jpg/01/83/55/76/1000_F_183557656_DRcvOesmfDl5BIyhPKrcWANFKy2964i9.jpg";
  }
}
