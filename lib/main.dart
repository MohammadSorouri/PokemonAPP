import 'package:flutter/material.dart';
import 'package:flutter_pokemon_ui/pokemon.dart';
import 'package:flutter_pokemon_ui/pokemon_detail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
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
  var url = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  PokeHub pokeHub;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }
  fetchData()async{
      var res = await http.get(url);
      var jsonDecode = json.decode(res.body);
      pokeHub = PokeHub.fromJson(jsonDecode);
      setState(() {});
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
      body: pokeHub == null ? Center(child: CircularProgressIndicator(),):
      GridView.count(crossAxisCount: 2,
        children: pokeHub.pokemon.map((pok)=>Padding(
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PokemonDetail(pokemon: pok,)));
            },
            child: Hero(
              tag: pok.img,
              child: Card(
                elevation: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(pok.img)),
                      ),
                    ),
                    Text(pok.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
            ),
          ),
          padding: EdgeInsets.all(2),
        )).toList(),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.refresh),backgroundColor: Colors.cyan,),

    );
  }
}
