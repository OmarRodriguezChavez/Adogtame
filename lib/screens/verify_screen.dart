import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyectofinal_cont_rdz/screens/dashboard_screen.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
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
          //resendEmailVerification();
          FirebaseAuth.instance.currentUser!.sendEmailVerification();
        }, child: Text('Reenviar código', style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.overline),) ),
        TextButton(onPressed: () {
          Navigator.pushNamed(context, '/login');
          }, child: Text('Sign In'))
      ]),
    );
  }
}