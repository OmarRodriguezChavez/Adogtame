import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyectofinal_cont_rdz/firebase/email_auth.dart';
import 'package:proyectofinal_cont_rdz/firebase/facebook_firebase.dart';
import 'package:proyectofinal_cont_rdz/firebase/google_auth.dart';
import 'package:proyectofinal_cont_rdz/screens/home_screen.dart';
import 'package:proyectofinal_cont_rdz/utils/color_itols.dart';

/*import '../widgets/reusable_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
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
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter UserName", Icons.person_outline, false,
                    _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Email Id", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outlined, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                firebaseUIButton(context, "Sign Up", () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    print("Created New Account");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                })
              ],
            ),
          ))),
    );
  }
}*/


import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
//import 'package:psmna10/provider/color_provider.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:proyectofinal_cont_rdz/utils/color_itols.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  User? user;
  TextEditingController emailUser = TextEditingController();
  TextEditingController passwordUser = TextEditingController();
  TextEditingController name=TextEditingController();
  TextEditingController lastnam=TextEditingController();
  String? username;
  EmailAuth emailAuth = EmailAuth();
  final ImagePicker _picker = ImagePicker();
  final _FormKey = GlobalKey<FormState>();
  bool isLoading = false;
  PickedFile? _imageFile;
  FaceAuth faceAuth= FaceAuth();
  GoogleAuth googleAuth=GoogleAuth();


  
 
  
  final spaceHorizont = SizedBox(height: 20);
@override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
  }
  @override
  Widget build(BuildContext context) {
    //ColorProvider colorApp = Provider.of<ColorProvider>(context);
    //_imageFile!;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        backgroundColor: hexStringToColor("CB2B93"),//Color.fromARGB(255, 246, 148, 171),//colorApp.getColorBar(),
        //Color.fromARGB(255, 246, 148, 171),
      ),
      body: Container(
        padding: const EdgeInsets.all(50.0),
        child: Form(
          key: _FormKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                //spaceHorizont,
                //imageProfile(),
                spaceHorizont,
                spaceHorizont,
                TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    controller: name,
    decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        hintText: 'First Name',
        labelText: 'First name',
        prefixIcon: Icon(Icons.person)),
    validator: MultiValidator(
      [RequiredValidator(errorText: 'Required*')],
    ),
  ),
                spaceHorizont,
                TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    controller: lastnam,
    decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        hintText: 'Last Name',
        labelText: 'Last name',
        prefixIcon: Icon(Icons.person)),
    validator: MultiValidator(
      [RequiredValidator(errorText: 'Required*')],
    ),
  ),
                spaceHorizont,
                TextFormField(
                  controller: emailUser,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        hintText: 'Email',
        labelText: 'Email',
        prefixIcon: Icon(Icons.email)),
    validator: MultiValidator(
      [
        RequiredValidator(errorText: 'Required*'),
        EmailValidator(errorText: 'Please enter your valid email'),
      ],
    ),
  ),
                spaceHorizont,
                TextFormField(
                  controller: passwordUser,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    obscureText: true,
    decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        hintText: 'Password',
        labelText: 'Password',
        prefixIcon: Icon(Icons.password)),
    validator: MultiValidator(
      [RequiredValidator(errorText: 'Required*')],
    ),
  ),
                spaceHorizont,
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: hexStringToColor("CB2B93"),//Color.fromARGB(255, 246, 148, 171),//colorApp.getColorBar(),
                    //Color.fromARGB(255, 246, 148, 171),
                    foregroundColor: Color.fromARGB(255, 29, 4, 4),
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    if (_FormKey.currentState!.validate() == true) {
                      try{
                          username=name.text+' '+lastnam.text;
                          emailAuth.registerWithEmailAndPassword(
                          email: emailUser.text,
                          password: passwordUser.text,
                          displayName: username!).then((value) {
                          FirebaseAuth.instance.currentUser!.updateDisplayName(username);
          if (value) {
            //user!.sendEmailVerification();
            //user!.displayName!=username.text;
            Navigator.pushNamed(context, '/verify');
          }
        });
      } catch (e) {
        AlertDialog(
          title: Text("Error"),
          content: Text("Ocurrió un error al procesar la información, por favor, vuelve a intentarlo"),
          actions: [
            TextButton(onPressed: (){MaterialPageRoute(builder: (context)=> RegisterScreen());}, child: Text('Aceptar'))
          ],
        );
      }
    } else {
      AlertDialog(
          title: Text("Error"),
          content: Text("Verifica que los datos sean correctos."),
          actions: [
            TextButton(onPressed: (){MaterialPageRoute(builder: (context)=> RegisterScreen());}, child: Text('Aceptar'))
          ],
        );
    }
                      
                      
                    

                    /*(_FormKey.currentState?.validate()) == true
            ? emailAuth.createUserWithEmailAndPassword(email: emailUser.text, password: passwordUser.text);
            //Navigator.pushNamed(context, '/login')
            : print("Button pressed");*/
                  },
                  child: const Text("Register"),
                ),
                const SizedBox(height: 15,),
                const Text('Or'),
                const SizedBox(height: 15,),
                /*SocialLoginButton(
                  buttonType: SocialLoginButtonType.google, onPressed: () 
                   async{
        isLoading=true;
        setState(() {});
        googleAuth.registerWithGoogle().then((value) {
         if(value ==1){
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
        faceAuth.signUpWithFacebook().then((value) {
         if(value==1){
             Navigator.pushNamed(context, '/dash',arguments:value);
             isLoading=false;
          }else{
            isLoading=false;
            SnackBar(content: Text('Verifica tus credenciales'),);
          }
          setState(() {});
        });
      },
    )*/

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 80.0,
            backgroundImage: _imageFile == null
                ? const AssetImage("assets/img.png") as ImageProvider
                : FileImage(File(_imageFile!.path)),
          ),
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => bottomSheet()),
                );
              },
              child: const Icon(
                Icons.camera_alt,
                color: Colors.teal,
                size: 28.0,
              ),
            ),
          ),
        ],
      ),
    );
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
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }
}
