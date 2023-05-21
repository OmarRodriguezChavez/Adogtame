import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectofinal_cont_rdz/firebase/facebook_firebase.dart';
import 'package:proyectofinal_cont_rdz/models/user_model.dart';
import 'package:proyectofinal_cont_rdz/provider/theme_provider.dart';
import 'package:proyectofinal_cont_rdz/screens/list_post.dart';


class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isDarkModeEnabled = false;
  FaceAuth faceAuth= FaceAuth();
   UserModel? user;

  @override
  Widget build(BuildContext context) {
     if(ModalRoute.of(context)!.settings.arguments!=null){
      user = ModalRoute.of(context)!.settings.arguments as UserModel;
    }
    //ColorProvider colorApp = Provider.of<ColorProvider>(context);
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Adogtame'),
        backgroundColor: Color.fromARGB(147, 210, 255, 7) //colorApp.getColorBar(),
      ),
      body: ListPost(),//const ListFavoritesCloud(), //ListPost(),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color.fromARGB(147, 210, 255, 7),
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
            const UserAccountsDrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 36, 159, 236)
                        //Color(colors/*colorApp.getColorBar()*/),
                        ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage:NetworkImage('url')// NetworkImage(user!.photoUrl.toString()),
                ),
                accountName: Text(''),//Text(user!.name.toString()),
                accountEmail:Text('')),// Text(user!.email.toString())),
            ListTile(
              onTap: () {},
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
                Navigator.pushNamed(context, '/save');
              },
              title: const Text('Guardado'),
              leading: const Icon(Icons.save_alt),
              trailing: const Icon(Icons.chevron_right),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/cat');
              },
              title: const Text('Categorias'),
              leading: const Icon(Icons.category),
              trailing: const Icon(
                Icons.chevron_right,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/logout');
              },
              title: const Text('Cerrar Sesión'),
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
