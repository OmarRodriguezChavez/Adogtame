import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyectofinal_cont_rdz/screens/dashboard_screen.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  ValueNotifier<bool> ver=ValueNotifier<bool>(false);
  User? user;
  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser!;
  }
void resendEmailVerification() {
    user?.sendEmailVerification();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text('Verifica la cuenta desde el link enviado a '+user!.email!),
        SizedBox(height: 15,),
        TextButton(onPressed: (){
          resendEmailVerification();
        }, child: Text('Reenviar código', style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.overline),) ),
        ValueListenableBuilder(valueListenable: ver, builder: (context, value, child){
          return TextButton(onPressed: (){
            ver.value=FirebaseAuth.instance.currentUser!.emailVerified;
            ver.value !=false
          ? Navigator.pushNamed(context, '/dash')
          : Navigator.pushNamed(context, '/verify');
          }, child: Text('Go to home'));
        }),
        /*TextButton(onPressed: 
        (){
          FirebaseAuth.instance.currentUser!.emailVerified
          ? Navigator.pushNamed(context, '/dash')
          : Navigator.pushNamed(context, '/dash');

        }, child: Text('Go to home'))*/
      
      ]),
    );
  }
}