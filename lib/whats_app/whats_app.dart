import 'package:flutter/material.dart';

class WhatsApp extends StatelessWidget {
  const WhatsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp"),
        centerTitle: false,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_outlined)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.message),
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Title $index"),
            subtitle: Text("Subtitle $index"),
            leading: CircleAvatar(
              child: Text("$index"),
            ),
            trailing: Column(
              children: const [
                Text("11:15 am"),
                SizedBox(
                  height: 10,
                ),
                CircleAvatar(
                  child: Text(
                    "2",
                    style: TextStyle(fontSize: 10),
                  ),
                  radius: 10,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
