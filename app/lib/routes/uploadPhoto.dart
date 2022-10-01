import 'package:app/routes.dart';
import 'package:flutter/material.dart';

class UploadPhoto extends StatefulWidget {
  const UploadPhoto({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<UploadPhoto> createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyStatelessWidget(),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  'Hello',
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
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
          Row(mainAxisSize: MainAxisSize.min, children: [
            Container(
                width: 110.0,
                height: 110.0,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://as1.ftcdn.net/v2/jpg/01/83/55/76/1000_F_183557656_DRcvOesmfDl5BIyhPKrcWANFKy2964i9.jpg")))),
          ]),
          Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 100.0, top: 30),
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.pink,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(45))),
                  padding: const EdgeInsets.all(10),
                  textStyle: const TextStyle(fontSize: 14),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(RouteGenerator.home);
                },
                child: const Text('Change Profile Picture'),
              ),
            ),
          ]),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.pink,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(45))),
                  padding: const EdgeInsets.only(
                      right: 30, left: 30, bottom: 15, top: 15),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(RouteGenerator.home);
                },
                child: const Text('UPLOAD PICTURE'),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.pink.withOpacity(0),
                    padding: const EdgeInsets.all(20.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(RouteGenerator.home);
                  },
                  child: const Text('SKIP',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              )
            ],
          )
        ]));
  }
}
