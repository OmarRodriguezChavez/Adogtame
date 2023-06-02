import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectofinal_cont_rdz/firebase/fav_firebase.dart';
import 'package:proyectofinal_cont_rdz/firebase/subs_firebase.dart';
import 'package:proyectofinal_cont_rdz/models/raza_model.dart';
import 'package:proyectofinal_cont_rdz/network/api_raza.dart';
import 'package:proyectofinal_cont_rdz/widgets/item_razas.dart';

import '../provider/flags_provider.dart';

class ListFavBreeds extends StatefulWidget {
  const ListFavBreeds({super.key});
 

  @override
  State<ListFavBreeds> createState() => _ListFavBreedsState();
}

class _ListFavBreedsState extends State<ListFavBreeds> {
  bool isFavoriteView = false;
  SubsFirebase _firebase= SubsFirebase();


  @override
  Widget build(BuildContext context) {
    //ColorProvider colorApp = Provider.of<ColorProvider>(context);
    FlagsProvider flag = Provider.of<FlagsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis suscripciones'),
      ),
      body:StreamBuilder(
        stream: _firebase.getAllsubs(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return GridView.builder(
              padding: EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
              ),
              itemCount:snapshot.data!.docs.length,
              itemBuilder: (context,index){
                BreedModel popularModel =BreedModel.fromQuerySnapshot(snapshot.data!.docs[index]);
                return ItemBreed(popularModel: popularModel);
              }
            );
          }else if(snapshot.hasError){
            return const Center(
              child: Text('Error al realizar la peticion'),
            );
          }else{
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      ) ,
    );
  }
}