import 'package:flutter/material.dart';
import 'package:quiz/util/firebase.helper.dart';
import 'package:quiz/util/app.styles.dart';
import 'package:quiz/util/size.congif.dart';
import 'package:quiz/util/shared_pref.dart';
import 'package:quiz/screens/home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {

  FirebaseService firebaseService = FirebaseService();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPass = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final Preferences preferences = Preferences();
  bool data = false;
  bool isLoading = false;

  Future<void> getData() async{
    bool data_ =  await preferences.checkIfDataExists();
      setState(() {
        data = data_;
      });
    }

  @override
    void initState() {
      super.initState();
      getData();
    }

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);

    void showMessage(String message, Color color) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: color,
          duration:  const Duration(seconds: 10),
          shape:  const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30) , topRight: Radius.circular(30) ),
          ),
        ),
        
      );
    }

    void redirect(){
      Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
    }

    Future<void> signIn() async {
      final formState = formKey.currentState;
      FocusScope.of(context).unfocus();

      if (formState!.validate()) {
        setState(() {
          isLoading = true;
        });

        
        String done = await firebaseService.signInWithEmail(_controllerEmail.text.trim(), _controllerPass.text);
        if(done == 'ok'){
          redirect();
        }else{
          showMessage(done, Colors.red);
        }
        
        setState(() {
          isLoading = false;
          }
        );
      }
    }


    if(data){
      return const HomePage();
    }

    return Scaffold(
      
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 5, 50, 80),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const SizedBox(
                  height: 90,
                ),

                Image.asset('assets/images/llave.png', height: 100,),

                const SizedBox(
                  height: 20,
                ),

                _textSignIn(),

                const SizedBox(
                  height: 30,
                ),

                _formFielEmail(),

                const SizedBox(
                  height: 20,
                ),

                _formFieldPass(),

                const SizedBox(height: 50),

                ElevatedButton(
                  onPressed: () {
                      signIn();
                  },

                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.blue, // Color del texto del botón
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), // Radio de los bordes del botón
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 15), // Espaciado interno del botón
                    textStyle: const TextStyle(fontSize: 18), // Estilo del texto del botón
                  ),
                  child: const Text("Ingresar"),
                ),
                
      
                const SizedBox(
                  height: 20,
                ),
      
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/register");
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: const Color.fromARGB(255, 59, 177, 4), // Color del texto del botón
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), // Radio de los bordes del botón
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15), // Espaciado interno del botón
                    textStyle: const TextStyle(fontSize: 18), // Estilo del texto del botón
                  ),
                  child: const Text("Registrarse"),
                ),

                const SizedBox(
                  height: 300,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textSignIn(){
    return Text("Iniciar Sesion", style: kJakartaHeading2.copyWith(
        fontSize: SizeConfig.blockSizeHorizontal! * kHeading2,
        color: kWhiteColor
      ),);
  }

  Widget _formFielEmail(){
    return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                  ),
                  child: TextFormField(
                    controller: _controllerEmail,
                    decoration: const InputDecoration(labelText: "E-mail"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor ingrese su E-mail.";
                      }
                      return null;
                    },
                   
                  ),
                );
  }

  Widget _formFieldPass(){
    return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                  ),

                  child: TextFormField(
                    controller: _controllerPass,
                    decoration: const InputDecoration(labelText: "Contraseña"),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor ingrese su Contraseña";
                      }
                      return null;
                    },
                    
                  ),
      );
  }


}