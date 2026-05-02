import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List users = [];
  bool isLoading = true;

  @override
  void initState(){
    super.initState();
    getApiData();
  }

  Future getApiData() async {
    var response = await http.get(
      Uri.parse('http://jsonplaceholder.typicode.com/users'),);
    if(response.statusCode == 200){
      users = jsonDecode(response.body);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Api Work"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: isLoading?const Center(child: CircularProgressIndicator(),)
            : ListView.builder(
          itemCount: users.length,
          itemBuilder: (context,index){
            return Card(
              margin: const EdgeInsets.all(8),
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(users[index]["name"][0]),
                ),
                title: Text(users[index]["name"]),
                subtitle: Text(users[index]["email"]),
                trailing: const Icon(Icons.arrow_forward),
              ),
            );
          },
        )


    );
  }
}