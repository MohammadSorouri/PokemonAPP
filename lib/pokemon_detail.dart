import 'package:flutter/material.dart';
import 'package:flutter_pokemon_ui/pokemon.dart';
class PokemonDetail extends StatelessWidget {
  final Pokemon pokemon;
  PokemonDetail({@required this.pokemon});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        elevation: 0,
        title: Text(pokemon.name),
        centerTitle: true,
      ),
      backgroundColor: Colors.cyan,
      body: Stack(
        children: <Widget>[
          Container(
            child: Positioned(
              height: MediaQuery.of(context).size.height/1.5,
              width: MediaQuery.of(context).size.width-20,
              left: 10,
              top: MediaQuery.of(context).size.height*0.1,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(height: MediaQuery.of(context).size.height/7,),
                    Text(pokemon.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    Text("Hei/ght: ${pokemon.height}"),
                    Text("Weight: ${pokemon.weight}"),
                    Text("Type",style: TextStyle(fontWeight: FontWeight.bold),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:pokemon.type==null?[Container()]: pokemon.type.map((t){
                        return FilterChip(backgroundColor: Colors.amber,onSelected: (b){},label: Text(t),selected: false,) ;
                      }).toList(),
                    ),
                    Text("Weaknesses",style: TextStyle(fontWeight: FontWeight.bold),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:pokemon.weaknesses==null?[Container()]: pokemon.weaknesses.map((t){
                        return FilterChip(backgroundColor: Colors.red,onSelected: (b){},label: Text(t,style: TextStyle(color: Colors.white),),selected: false,) ;
                      }).toList(),
                    ),
                    Text("Next Evolution",style: TextStyle(fontWeight: FontWeight.bold),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:pokemon.nextEvolution==null?[Container()]: pokemon.nextEvolution.map((t){
                        return FilterChip(backgroundColor: Colors.green,onSelected: (b){},label: Text(t.name,style: TextStyle(color: Colors.white),),selected: false,) ;
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(tag: pokemon.img, child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(pokemon.img),fit: BoxFit.cover)
              ),
              width: 200,
              height: 200,
            )),
          )
        ],
      )
    );
  }
}
