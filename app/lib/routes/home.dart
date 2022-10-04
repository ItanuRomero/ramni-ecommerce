import 'package:flutter/material.dart';

void main() => runApp(const Home());

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.menu_rounded,
          color: Colors.black,
        ),
        actions: [
          Icon(Icons.notifications_active, color: Colors.black),
          Icon(Icons.shopping_cart, color: Colors.black),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 4,
        children: List.generate(10, (index) {
          return Center(
              child: Column(
            children: [
              Image.asset(
                'images/logo_app.png',
                height: MediaQuery.of(context).size.height / 3,
                color: Colors.white,
                fit: BoxFit.contain,
                alignment: Alignment.topCenter,
              ),
              Text('Item')
            ],
          ));
        }),
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
        selectedItemColor: Color.fromARGB(255, 24, 0, 11),
      ),
    );
  }
}
