import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My First App"),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              DrawerHeader(
                child: Text("Dhrumil Shah"),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              FlutterLogo(
                size: 120,
              ),
              Text("DESCRIPTION"),
              Icon(
                Icons.music_note,
                size: 120,
                color: Colors.green,
              ),
              Icon(
                Icons.music_note,
                size: 120,
                color: Colors.green,
              ),
              Icon(
                Icons.music_note,
                size: 120,
                color: Colors.green,
              ),
              Icon(
                Icons.music_note,
                size: 120,
                color: Colors.green,
              ),
              Icon(
                Icons.music_note,
                size: 120,
                color: Colors.green,
              ),
              Icon(
                Icons.music_note,
                size: 120,
                color: Colors.green,
              ),
              Icon(
                Icons.music_note,
                size: 120,
                color: Colors.green,
              ),
              Icon(
                Icons.music_note,
                size: 120,
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
        ),
      ),
      body: const Center(
        child: Text(
          "This is a body",
          style: TextStyle(
            fontSize: 80,
            color: Colors.red,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
