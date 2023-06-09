import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:proyectofinal_cont_rdz/firebase/fav_firebase.dart';
import 'package:proyectofinal_cont_rdz/firebase/post_firebase.dart';
import 'package:proyectofinal_cont_rdz/provider/font_provider.dart';
import 'package:proyectofinal_cont_rdz/provider/theme_provider.dart';

class ListPost extends StatefulWidget {
  const ListPost({super.key});

  @override
  State<ListPost> createState() => _ListPostState();
}

class _ListPostState extends State<ListPost> {
  PostFirebase _firebase = PostFirebase();
  FavFirebase _fav = FavFirebase();
  Color primarycolor=Colors.blue;
  ValueNotifier<bool> isfav = ValueNotifier<bool>(false);
  
  
  @override
  Widget build(BuildContext context) {
    var google=GoogleFonts;
    return Scaffold(
      body: StreamBuilder(
        stream: _firebase.getAllPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  height: 470,
                  width: double.infinity,
                  decoration: BoxDecoration
                  (
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                   // boxShadow: Colors.black,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          color: Color.fromARGB(255, 205, 153, 207),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              
                              Text(snapshot.data!.docs[index].get('name'),
                              style: GoogleFonts.abel(
                          textStyle: TextStyle(color: Colors.black, letterSpacing: .5, fontSize: 35, fontWeight: FontWeight.bold),
                        )
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text('Edad : ',style: GoogleFonts.abel(
                          textStyle: TextStyle(color: Colors.black, letterSpacing: .5, fontSize: 20,fontWeight: FontWeight.bold),
                        ))
                            ],
                          ),
                           Column(
                           
                            children: [
                              Text(snapshot.data!.docs[index].get('age').toString(),style: GoogleFonts.abel(
                          textStyle: TextStyle(color: Colors.black, letterSpacing: .5, fontSize: 20),
                        )),
                            ],
                          ),
                          //Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
                            
                            const SizedBox(
                              height: 10,
                              width: 15,
                            ),
                            Text('Raza: ',style: GoogleFonts.abel(
                          textStyle: TextStyle(color: Colors.black, letterSpacing: .5, fontSize: 20,fontWeight: FontWeight.bold),
                        )),
                            Text(snapshot.data!.docs[index].get('raza'),style: GoogleFonts.abel(
                          textStyle: TextStyle(color: Colors.black, letterSpacing: .5, fontSize: 20),
                        )),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        
                        children: [
                          Column(
                            children: [
                              Text('Talla: ',style: GoogleFonts.abel(
                          textStyle: TextStyle(color: Colors.black, letterSpacing: .5, fontSize: 20,fontWeight: FontWeight.bold),
                        )),
                            ],
                          ),
                          Column(
                            children: [
                              Text(snapshot.data!.docs[index].get('talla'),style: GoogleFonts.abel(
                          textStyle: TextStyle(color: Colors.black, letterSpacing: .5, fontSize: 20),
                        )),
                            ],
                          ),
                          
                            const SizedBox(
                              height: 10,
                              width: 15,
                            ),
                             Text('Sexo: ',style: GoogleFonts.abel(
                          textStyle: TextStyle(color: Colors.black, letterSpacing: .5, fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                            Text(snapshot.data!.docs[index].get('Sexo'),style: GoogleFonts.abel(
                          textStyle: TextStyle(color: Colors.black, letterSpacing: .5, fontSize: 20),
                        )),
                        ],
                      ),
                      //SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //Image(image: snapshot.data!.docs[index].get('image'))
                          CachedNetworkImage(
                            imageUrl: snapshot.data!.docs[index].get('image'),
                                                width: 300,
                                                height: 250,
                                                fit: BoxFit.cover,
                          ),
                         //Image.network(snapshot.data!.docs[index].get('image'),
                         //height: 300,width: 350,)
                        ],
                      ),
                     // SizedBox(height: 5,),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        /*ValueListenableBuilder(
                          valueListenable: isfav, 
                          builder: (context, value, child){
                            return IconButton(
                            onPressed: () {
                              isfav.value= !isfav.value;
                              if(isfav.value)
                              {
                                _fav.insPost({
                                  'id':snapshot.data!.docs[index].get('id'),
                                'name': snapshot.data!.docs[index].get('name'),
                                'image': snapshot.data!.docs[index].get('image'),
                                'age': snapshot.data!.docs[index].get('age'),
                                'talla': snapshot.data!.docs[index].get('talla'),
                                'raza': snapshot.data!.docs[index].get('raza'),
                                'Sexo': snapshot.data!.docs[index].get('Sexo'),
                                'contact': snapshot.data!.docs[index].get('contact'),
                              });
                              }
                              if(isfav.value == false){
                                 _fav.delPost(snapshot.data!.docs[index].id);
                              }   
                              
                            },
                            icon: isfav.value ==true
                            ? const Icon(Icons.favorite)
                            : const Icon(Icons.favorite_outline));
                          }),*/
                        
                        /*IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Confirmar borrado'),
                                  content:
                                      const Text('Deseas borrar de favoritos?'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          _fav.delPost(
                                              snapshot.data!.docs[index].id);
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Sí')),
                                    TextButton(
                                        onPressed: () {},
                                        child: const Text('No'))
                                  ],
                                ),
                              );
                            },
                            icon: const Icon(Icons.delete)),*/
                        IconButton(
                            onPressed: () {
                              AlertDialog alert = AlertDialog(
      title: Text("Contacto"),
      content: Expanded(child: Text(snapshot.data!.docs[index].get('contact').toString())
      
      ),
      
      actions: [
        ElevatedButton(
      child: Text("Aceptar"),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(primarycolor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      onPressed: () {
        Navigator.of(context).pop();
        
      },
    ),
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
                            },
                            icon: const Icon(Icons.contact_emergency)),
                      ],
                    )
                   ],
                  ),
                );
              }
            );
         }else if (snapshot.hasError) {
            return Center(
                child: Text('Error en en la petición, intente de nuevo'));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          }
    ),
    );
  }
}