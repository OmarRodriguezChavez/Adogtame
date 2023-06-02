import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:proyectofinal_cont_rdz/firebase/facebook_firebase.dart';
import 'package:proyectofinal_cont_rdz/firebase/google_auth.dart';
import 'package:proyectofinal_cont_rdz/screens/dashboard_screen.dart';
import 'package:proyectofinal_cont_rdz/screens/home_screen.dart';
import 'package:proyectofinal_cont_rdz/screens/reset_password.dart';
import 'package:proyectofinal_cont_rdz/screens/signup_screen.dart';
import 'package:proyectofinal_cont_rdz/screens/verify_screen.dart';
import 'package:proyectofinal_cont_rdz/utils/color_itols.dart';
import 'package:proyectofinal_cont_rdz/widgets/reusable_widget.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String userEmail = "";
  bool isLoading = false;
  User? user;
  /*EmailAuth emailAuth=EmailAuth();
  GoogleAuth googleAuth= GoogleAuth();*/
  FaceAuth faceAuth= FaceAuth();
  GoogleAuth googleAuth=GoogleAuth();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("CB2B93"),
          hexStringToColor("9546C4"),
          hexStringToColor("5E61F4")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/piritop.png"),
                const SizedBox(
                  height: 30,
                ),
                reusableTextField("Enter UserName", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 5,
                ),
                forgetPassword(context),
                firebaseUIButton(context, "Sign In", ()async {
                  var ban = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text);
                           if (ban.user?.emailVerified ?? false) {
                  Navigator.pushNamed(context, '/dash');
                } else {
                  Navigator.pushNamed(context, '/verify');

                }
                          
                }),
                signUpOption(),
                const SizedBox(
                  height: 15,
                ),
                SocialLoginButton(
                  buttonType: SocialLoginButtonType.google, onPressed: () 
                   async{
        isLoading=true;
        setState(() {});
        googleAuth.signInWithGoogle().then((value) {
         if(value.name!=null){
             Navigator.pushNamed(context, '/dash',arguments:value);
             isLoading=false;
          }else{
            isLoading=false;
            SnackBar(content: Text('Verifica tus credenciales'),);
          }
          setState(() {});
        });
      }
                  ),
                const SizedBox(
                  height: 20,
                ),
                SocialLoginButton(
      buttonType: SocialLoginButtonType.facebook,
      onPressed: () async{
        isLoading=true;
        setState(() {});
        faceAuth.signInWithFacebook().then((value) {
         if(value.name!=null){
             Navigator.pushNamed(context, '/dash',arguments:value);
             isLoading=false;
          }else{
            isLoading=false;
            SnackBar(content: Text('Verifica tus credenciales'),);
          }
          setState(() {});
        });
      },
    )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RegisterScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ResetPassword())),
      ),
    );
  }
}