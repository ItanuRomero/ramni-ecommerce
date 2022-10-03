import 'dart:io';

import 'package:app/models/user.dart';
import 'package:app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import '../widgets/hello_user.dart';

class UploadPhoto extends StatefulWidget {
  const UploadPhoto({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<UploadPhoto> createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {
  File? _image;

  Future getImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;

      //final imageTemporary = File(image.path);
      final imagePermanent = await saveFilePermanently(image.path);

      setState(() {
        _image = imagePermanent;
      });
    } on PlatformException {
      // to do: show message error
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('Oh no... failed to pick image')),
      // );
    }
  }

  Future<File> saveFilePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              gradient: LinearGradient(
                  colors: [
                    Colors.pink,
                    Colors.redAccent,
                  ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      HelloUserWidget(),
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 60),
                      child: const Text(
                        'Welcome to the Ramni',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontFamily: 'SFProDisplayThin'),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _image != null
                        ? ClipRRect(
                            borderRadius:
                                BorderRadius.circular(90.0), //add border radius
                            child: Image.file(_image!,
                                width: 120.0, height: 120.0, fit: BoxFit.cover),
                          )
                        : ClipRRect(
                            borderRadius:
                                BorderRadius.circular(90.0), //add border radius
                            child: Image.network(
                                width: 120.0,
                                height: 120.0,
                                "https://as1.ftcdn.net/v2/jpg/01/83/55/76/1000_F_183557656_DRcvOesmfDl5BIyhPKrcWANFKy2964i9.jpg"),
                          ),
                  ],
                ),
                Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 100.0, top: 30),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(45))),
                        padding: const EdgeInsets.all(15),
                        textStyle: const TextStyle(fontSize: 14),
                      ),
                      onPressed: getImage,
                      child: const Text('Change Profile Picture'),
                    ),
                  ),
                ]),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Consumer<User>(builder: (context, storedValue, child) {
                      return TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(45))),
                          padding: const EdgeInsets.only(
                              right: 40, left: 40, bottom: 20, top: 20),
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                        onPressed: () {
                          storedValue.setPhoto(_image);
                          Navigator.of(context).pushNamed(RouteGenerator.home);
                        },
                        child: const Text(
                          'UPLOAD PICTURE',
                          style: TextStyle(fontFamily: 'SFProDisplaySemibold'),
                        ),
                      );
                    })
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Consumer<User>(
                        builder: (context, storedValue, child) {
                          return TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.pink.withOpacity(0),
                              padding: const EdgeInsets.all(20.0),
                              textStyle: const TextStyle(fontSize: 20),
                            ),
                            onPressed: () {
                              storedValue.setPhoto(null);
                              Navigator.of(context)
                                  .pushNamed(RouteGenerator.home);
                            },
                            child: const Text('SKIP',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white)),
                          );
                        },
                      ),
                    ),
                  ],
                )
              ],
            )));
  }
}
