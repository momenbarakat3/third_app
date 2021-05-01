import 'package:flutter/material.dart';
import 'page.dart';
import'data.dart';
import'package:third_app/models.dart';
class list extends StatefulWidget {
  @override
  _listState createState() => _listState();
  static BuildContext context;
  static List<Location> locations=(new locationsAll()).listobj;
}

class _listState extends State<list> {
  List<Location> locations = list.locations;
  @override
  Widget build(BuildContext context) {
    list.context=context;
    return Scaffold(
      appBar: AppBar(
        title: Text('FavLocation',
          style: TextStyle(color: Colors.black),
        ) ,
        centerTitle: true ,
        backgroundColor: Colors.cyan[100] ,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){

          return Container(
              child: Card(
                child: Wrap(
                  children: [
                    Image.network(locations[index].imageUrl),
                    ListTile(
                        tileColor: Colors.cyan[50],

                        onTap:  (){
                          navigateToDescription(locations[index]);
                        },
                        title:   Text(locations[index].name),
                        subtitle : Text(locations[index].theme)
                    )
                  ],
                ),
              )
          );

        },

      ),

    );

  }
  void navigateToDescription(Location location6){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> page(location6)));
  }
}