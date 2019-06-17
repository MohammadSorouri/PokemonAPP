import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokemon App ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }
  fetchData()async{

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Poke App"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      drawer: Drawer(
      ),
      body: Center(
        child:  Text("Hello from Pokemon App"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.refresh),backgroundColor: Colors.cyan,),

    );
  }
}
