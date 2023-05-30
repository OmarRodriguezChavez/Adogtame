import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:proyectofinal_cont_rdz/firebase/post_firebase.dart';
import 'package:proyectofinal_cont_rdz/provider/flags_provider.dart';
import 'package:proyectofinal_cont_rdz/screens/photo_screen.dart';


class AddPostScreen extends StatefulWidget {
  AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  PickedFile? _imageFile;
    ValueNotifier<XFile?> image = ValueNotifier<XFile?>(null);
    
    final name = TextEditingController();
    final raza = TextEditingController();
    final talla = TextEditingController();
    final sexo = TextEditingController();
    final img = TextEditingController();
    final age = TextEditingController();
    final contact = TextEditingController();
    String? url;
    PostFirebase _firebase = PostFirebase();
    final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    //final ImagePicker _picker = ImagePicker();
    FlagsProvider flag = Provider.of<FlagsProvider>(context);
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(20),
          height: 560,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color:Color.fromARGB(255, 205, 153, 207), border: Border.all(color: Colors.black)),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Name'),
              TextFormField(
                controller: name,
                decoration: const InputDecoration(
                border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                Radius.circular(10),
                ),
              ),
              hintText: 'Name',
              labelText: 'Name',
            ),
                
                //maxLines: 8,
              
              ),
              SizedBox(height: 15,),
              Text('Sexo'),
              TextFormField(
                controller: sexo,
                decoration: const InputDecoration(
        border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
        Radius.circular(10),
        ),
      ),
      hintText: 'Sexo',
      labelText: 'Sexo',
    ),
              ),
              SizedBox(height: 15,),
              Text('Talla'),
              TextFormField(
                controller: talla,
                decoration: const InputDecoration(
        border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
        Radius.circular(10),
        ),
      ),
      hintText: 'Talla',
      labelText: 'Talla',
    ),
              ),
              SizedBox(height: 15,),
              Text('Edad'),
              TextFormField(
                controller: age,
                decoration: const InputDecoration(
        border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
        Radius.circular(10),
        ),
      ),
      hintText: 'Age',
      labelText: 'Age',
    ),
              ),
              SizedBox(height: 15,),
              Text('Raza'),
              TextFormField(
                controller: raza,
                decoration: const InputDecoration(
        border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
        Radius.circular(10),
        ),
      ),
      hintText: 'Raza',
      labelText: 'Raza',
    ),
              ),
              SizedBox(height: 15,),
              Text('Contacto'),
              TextFormField(
                controller: contact,
                decoration: const InputDecoration(
        border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
        Radius.circular(10),
        ),
      ),
      hintText: 'Contacto',
      labelText: 'Contacto',
    ),
              ),
              SizedBox(height: 15,),
               Row(
                    children: [
                      
                      TextButton(
                        style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 97, 97, 97),
                    //Color.fromARGB(255, 246, 148, 171),
                    foregroundColor: Color.fromARGB(255, 29, 4, 4),
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                        onPressed: ()async {
                        showModalBottomSheet(
                          context: context,
                          builder: ((builder) => bottomSheet()),
                        );
            }, child: Text('Subir imagen')),
            Expanded(child: Text(url ?? ''
            )),
                    ],
                      ),
              SizedBox(height: 15,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 205, 153, 207),//colorApp.getColorBar(),
                    //Color.fromARGB(255, 246, 148, 171),
                    foregroundColor: Color.fromARGB(255, 255, 255, 255),
                  ),
                  onPressed: () async{
                    if (image.value != null) {  
                          final uploaded = await loadImage(File(image.value!.path));
                          if (uploaded) {
                            flag.setFlagListPost();
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text('Imagen subida correctamente')));
                                 _firebase.insPost({
                        'name': name.text,
                        'image': url.toString(),
                        'age': age.text,
                        'talla': talla.text,
                        'raza': raza.text,
                        'Sexo': sexo.text,
                        'contact': contact.text,
                              }).then((value) {
                        Navigator.pop(context);
                      });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text('Error al subir la imagen')));
                            }
                        }
                    //loadImage(File(image.value!.path));
                     /* _firebase.insPost({
                        'name': name.text,
                        'image': url.toString(),
                        'age': age.text,
                        'talla': talla.text,
                        'raza': raza.text,
                        'Sexo': sexo.text,
                              })
                        .then((value) {
                          /*value > 0
                            ? 'Registro insertado'
                            : 'Ocurrió un error';
                        var snackBar = SnackBar(content: Text(msj));*/
                        Navigator.pop(context);
                        //ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      });*/
                   
                    
                    flag.setFlagListPost();
                  },
                  child: const Text('Save'))
            ],
          ),
        ),
      ),
    );
  }
  
  Future<bool> loadImage(File image) async {
  
  final imageName = DateTime.now();
  
  imagePath = "/PostImages/$imageName.jpg";
  Reference ref = storage.ref().child(imagePath);

  
  final UploadTask uploadTask = ref.putFile(image);

  final TaskSnapshot snapshot = await uploadTask.whenComplete(() => true);

   String downloadURL = await ref.getDownloadURL();

  //await FirebaseAuth.instance.currentUser?.updatePhotoURL(downloadURL);
  url=downloadURL;

  if(snapshot.state == TaskState.success){
    return true;
  }else{
    return false;
  }
  //return downloadURL;
}

   Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          const Text(
            "Choose profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                icon: Icon(Icons.camera),
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                label: Text("Camera"),
              ),
              TextButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                label: Text("Gallery"),
              )
            ],
          ),
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    image.value = await _picker.pickImage(source:source);
  }

 
}