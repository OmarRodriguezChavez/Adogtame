import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectofinal_cont_rdz/firebase/email_auth.dart';
import 'package:proyectofinal_cont_rdz/firebase/facebook_firebase.dart';
import 'package:proyectofinal_cont_rdz/firebase/google_auth.dart';
import 'package:proyectofinal_cont_rdz/models/user_model.dart';
import 'package:proyectofinal_cont_rdz/provider/flags_provider.dart';
import 'package:proyectofinal_cont_rdz/provider/theme_provider.dart';
import 'package:proyectofinal_cont_rdz/screens/list_post.dart';
import 'package:proyectofinal_cont_rdz/utils/color_itols.dart';


class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

ValueNotifier<bool> imageChange = ValueNotifier<bool>(false);
class _DashboardScreenState extends State<DashboardScreen> {
  bool isDarkModeEnabled = false;
  FaceAuth faceAuth= FaceAuth();
  EmailAuth emailAuth= EmailAuth();
  GoogleAuth googleAuth=GoogleAuth();
  UserModel? user;
  //User? users;
  File? imagen;
/*@override
  void initState() {
    super.initState();
    //users = FirebaseAuth.instance.currentUser;
  }*/
  @override
  Widget build(BuildContext context) {
    
    //ColorProvider colorApp = Provider.of<ColorProvider>(context);
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    FlagsProvider flag = Provider.of<FlagsProvider>(context);

    if(ModalRoute.of(context)!.settings.arguments!=null){
      user = ModalRoute.of(context)!.settings.arguments as UserModel;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Adogtame'),
        backgroundColor: hexStringToColor("CB2B93")//Color.fromARGB(146, 234, 7, 255) //colorApp.getColorBar(),
      ),
      body: ListPost(),//const ListFavoritesCloud(), //ListPost(),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: hexStringToColor("CB2B93"),//Color.fromARGB(146, 234, 7, 255),
        onPressed: () {
          Navigator.pushNamed(context, '/add').then((value) {
            setState(() {});
          },);
        },
        label: const Text('Add Post'),
        icon: const Icon(Icons.add_comment),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
             ValueListenableBuilder(
              valueListenable: imageChange,
              builder: (context, value, child) {
              return UserAccountsDrawerHeader(
                
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 102, 24, 81)
                        //Color(colors/*colorApp.getColorBar()*/),
                        ),
                currentAccountPicture: CircleAvatar(
                  
                  backgroundImage: FirebaseAuth.instance.currentUser!.photoURL !=null//user?.photoUrl != null
                    ? CachedNetworkImage(imageUrl: FirebaseAuth.instance.currentUser!.photoURL!)as ImageProvider
                    : AssetImage('assets/avatar.png') as ImageProvider,
                  /*? NetworkImage(FirebaseAuth.instance.currentUser!.photoURL!)
                  : AssetImage('assets/avatar.png') as ImageProvider,*/
                ),
               accountName: Text(FirebaseAuth.instance.currentUser!.displayName!),//Text(_credentials),//Text(user!.name.toString()),
                accountEmail:Text(FirebaseAuth.instance.currentUser!.email!));}),//Text(_mail)),// Text(user!.email.toString())),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/edit');
              },
              title: const Text('Perfil'),
              subtitle: const Text('Edit Perfil'),
              leading: const Icon(Icons.person),
              trailing: const Icon(Icons.chevron_right),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/theme');
              },
              title: const Text('Temas'),
              subtitle: const Text('Preferencias del tema'),
              leading: const Icon(Icons.settings),
              trailing: const Icon(Icons.chevron_right),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/favs');
              },
              title: const Text('Mis Suscripciones'),
              leading: const Icon(Icons.favorite_border),
              trailing: const Icon(Icons.chevron_right),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/cat');
              },
              title: const Text('Razas'),
              leading: const Icon(Icons.category),
              trailing: const Icon(
                Icons.chevron_right,
              ),
            ),
            ListTile(
              onTap: () {
                emailAuth.signOut();
                Navigator.pushNamed(context, '/login');
              },
              title: const Text('Logout'),
              leading: const Icon(Icons.logout),
              trailing: const Icon(
                Icons.chevron_right,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
