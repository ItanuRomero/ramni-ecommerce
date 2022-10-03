import 'dart:io';

import 'package:app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhotoHomeUserWidget extends StatelessWidget {
  const PhotoHomeUserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    File? image = context.read<User>().photo;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(90.0),
          child: image != null
              ? Image.file(image, width: 120, height: 120, fit: BoxFit.cover)
              : Image.network(context.read<User>().srcDefaultPhoto(),
                  width: 120, height: 120, fit: BoxFit.cover),
        ),
      ],
    );
  }
}


/*
Widget build(BuildContext context) {
    File? image = context.read<User>().photo;
    ImageProvider<Object> imageShow;
    if (image != null) {
      imageShow = FileImage(image);
    } else {
      imageShow = NetworkImage(context.read<User>().srcDefaultPhoto());
    }
    return CircleAvatar(backgroundImage: imageShow);
  }
 */