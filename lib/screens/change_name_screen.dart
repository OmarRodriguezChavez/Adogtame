import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectofinal_cont_rdz/provider/flags_provider.dart';


class ChangeName extends StatelessWidget {
  ChangeName({super.key});
 
  @override
  Widget build(BuildContext context) {
   
    FlagsProvider flag = Provider.of<FlagsProvider>(context);
    final txtConsPost = TextEditingController();
  
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(15),
          height: 350,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 205, 153, 207), border: Border.all(color: Colors.black)),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: txtConsPost,
                maxLines: 8,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    //backgroundColor: colorApp.getColorBar(),
                    //Color.fromARGB(255, 246, 148, 171),
                    foregroundColor: Color.fromARGB(255, 205, 153, 207),
                  ),
                  onPressed: () {
                      FirebaseAuth.instance.currentUser!.updateDisplayName(txtConsPost.text);
                      Navigator.pop(context);
                      flag.setFlagListPost(); 
                    },
                  child: const Text('Save')),
            ],
          ),
        ),
      ),
    );
  }
}