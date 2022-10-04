import 'package:app/models/user.dart';
import 'package:app/widgets/photo_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.count(
        crossAxisCount: 4,
        children: List.generate(20, (index) {
          return LayoutBuilder(
            builder: (_, constrains) => Column(
            children: [
              Image.asset(
                'images/chair2.png',
                height: 50,
                color: Colors.black,
                fit: BoxFit.contain,
                alignment: Alignment.topCenter,
              ),
              const Text('Item')
            ],
          ));
        }),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.pink),
              child: PhotoHomeUserWidget(),
            ),
            Consumer<User>(builder: (context, storedValue, child) {
                      return ListTile(
                        title: Text(storedValue.name, style: const TextStyle(
                            color: Colors.pink,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),),
                        onTap: () {},
                      );
            }),
            Consumer<User>(builder: (context, storedValue, child) {
                      return ListTile(
                        title: Text(storedValue.email, style: const TextStyle(
                            color: Colors.pink,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),),
                        onTap: () {},
                      );
            }),
            Consumer<User>(builder: (context, storedValue, child) {
                      return ListTile(
                        title: Text(storedValue.phoneNumber, style: const TextStyle(
                            color: Colors.pink,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),),
                        onTap: () {},
                      );
            }),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pink,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: '',
          ),
        ],
        selectedItemColor: const Color.fromARGB(255, 24, 0, 11),
      ),
    );
  }
}
