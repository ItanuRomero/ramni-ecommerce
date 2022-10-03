import 'dart:io';

import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  String name;
  File? photo;

  User(this.name, this.photo);

  void setPhoto(File? photo) {
    this.photo = photo;
    notifyListeners();
  }

  String srcDefaultPhoto() {
    return "https://as1.ftcdn.net/v2/jpg/01/83/55/76/1000_F_183557656_DRcvOesmfDl5BIyhPKrcWANFKy2964i9.jpg";
  }
}
