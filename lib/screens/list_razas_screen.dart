import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectofinal_cont_rdz/models/raza_model.dart';
import 'package:proyectofinal_cont_rdz/network/api_raza.dart';
import 'package:proyectofinal_cont_rdz/widgets/item_razas.dart';

import '../provider/flags_provider.dart';

class ListBreeds extends StatefulWidget {
  const ListBreeds({super.key});
 

  @override
  State<ListBreeds> createState() => _ListBreedsState();
}

class _ListBreedsState extends State<ListBreeds> {
  ApiBreed? apiPopular;
  bool isFavoriteView = false;
  //DatabaseHelper? database;

  @override
  void initState() {
    super.initState();
    apiPopular = ApiBreed();
   // database = DatabaseHelper();
  }

  @override
  Widget build(BuildContext context) {
    //ColorProvider colorApp = Provider.of<ColorProvider>(context);
    FlagsProvider flag = Provider.of<FlagsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,//colorApp.getColorBar(),
        title: const Text('List Popular'),
      ),
      body: FutureBuilder(
          future: apiPopular!.getHttp(),
          builder: (context, AsyncSnapshot<List<BreedModel>?> snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                padding: EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .8,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: snapshot.data != null ? snapshot.data!.length : 0,
                itemBuilder: (context, index) {
                  BreedModel objPopularModel = snapshot.data![index];

                  return GestureDetector(
                    onTap: () {
                    },
                    child: Hero(
                      tag: snapshot.data![index].id!,
                      child: ItemBreed(popularModel: snapshot.data![index]),
                    ),
                  );
                  //return ItemPopular(popularModel: snapshot.data![index]);
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('OCURRIO UN ERROR' + snapshot.error.toString()),
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}