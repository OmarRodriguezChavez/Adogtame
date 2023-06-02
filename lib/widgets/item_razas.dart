import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:proyectofinal_cont_rdz/databse/database_helper.dart';
import 'package:proyectofinal_cont_rdz/firebase/subs_firebase.dart';
import 'package:proyectofinal_cont_rdz/models/raza_model.dart';
import 'package:proyectofinal_cont_rdz/network/api_raza.dart';
import 'package:proyectofinal_cont_rdz/provider/flags_provider.dart';

class ItemBreed extends StatefulWidget {
  ItemBreed({super.key, required this.popularModel});
  BreedModel popularModel;

  @override
  State<ItemBreed> createState() => _ItemBreedState();
}

class _ItemBreedState extends State<ItemBreed> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  ApiBreed? apiBreed;
  SubsFirebase _firebase = SubsFirebase();
  //DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    apiBreed = ApiBreed();
   // database = DatabaseHelper();
  }
  @override
  //apiBreed=ApiBreed();
  Widget build(BuildContext context) {
    FlagsProvider flag = Provider.of<FlagsProvider>(context);
    return ListView(
  
      children: [
        Container(
          
          child: ClipRRect(
              child:FadeInImage(
                height: 150,
                width: 50,
                    fit: BoxFit.fill,
                    placeholder: const AssetImage('assets/loading1.gif'),
                    image: CachedNetworkImage(imageUrl: "https://cdn2.thedogapi.com/images/${widget.popularModel.reference_image_id}.jpg") as ImageProvider
                    //NetworkImage( "https://cdn2.thedogapi.com/images/${widget.popularModel.reference_image_id}.jpg" ,),
                        //"https://cdn2.thedogapi.com/images/${widget.popularModel.reference_image_id}.jpg"),
                  
              ),
          )),
              Row(
                children: [
                  Expanded(child: Text(widget.popularModel.name.toString(),style: GoogleFonts.abel(
                          textStyle: TextStyle(color: Colors.black, letterSpacing: .5, fontSize: 20, fontWeight: FontWeight.bold))))
                  
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: widget.popularModel.origin!=null
                    ?Text(widget.popularModel.origin.toString(), textAlign: TextAlign.center, )
                    : Text('Sin información', textAlign: TextAlign.center,)
                  )
                ],
              ),
              Expanded(
                child: widget.popularModel.bred_for!=null 
                ? Text(widget.popularModel.bred_for.toString(), textAlign: TextAlign.center,)
                : Text('Sin información', textAlign: TextAlign.center,)
              ),
              Row(
                  children: [
                     FutureBuilder(
                      future: _firebase.searchPopular(widget.popularModel.id!),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return TextButton(
                           /* icon: Icon(Icons.favorite_sharp),
                            color: snapshot.data != true ? Colors.blue : Colors.red,*/
                            style: TextButton.styleFrom(
                            backgroundColor: snapshot.data != true 
                            ? Colors.red 
                            : Colors.blue),
                            onPressed: () {
                              if (snapshot.data != true ) {
                                //databaseHelper.INSERT(widget.popularModel!.toMap()).then((value) => flag.setFlagListPost());
                                _firebase.inssubs({
                                    'id':widget.popularModel.id,
                                    'name': widget.popularModel.name,
                                    'reference_image_id': "${widget.popularModel.reference_image_id}",
                                    'origin':widget.popularModel.origin,
                                    'bred_for':widget.popularModel.bred_for})
                                    .then((value) => flag.setFlagListPost());
                                    
                              } else {
                                //databaseHelper.DELETE(widget.popularModel.id!, 'id').then((value) => flag.setFlagListPost());
                                _firebase.delFavorite(widget.popularModel.id!).then((value) => flag.setFlagListPost());
                              }
                            },
                            child: snapshot.data != true 
                            ? Text('Suscribete',style: TextStyle(color: Colors.white)) 
                            : Text('Suscrito' ,style: TextStyle(color: Colors.white)),
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                  ],
                ),
            ],
          );
  }
}
