import 'package:flutter/material.dart';
import 'package:quiz/util/firebase.helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz/util/app.styles.dart';
import 'package:quiz/util/size.congif.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseService firebaseService = FirebaseService();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPass = TextEditingController();
  final TextEditingController _controllerCedula = TextEditingController();
  final TextEditingController _controllerEdad = TextEditingController();

  bool isLoading = false;
  String? _selectedOption;
  String? _selectedOption2;
  String? _selectedOption3;

  void showMessage(String message, Color color) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: color,
          duration:  const Duration(seconds: 5),
          shape:  const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30) , topRight: Radius.circular(30) ),
          ),
        ),
        
      );
    }

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);

    void redirect (){
      Navigator.pushNamed(context, '/');
    }

    

    Future<void> createUser() async {
      FocusScope.of(context).unfocus();
      final formState = _formKey.currentState;

      if (formState!.validate()) {

        setState(() {
          isLoading = true;
        });

        try {

          UserCredential userCredential = await firebaseService.createUser(
            _controllerEmail.text.trim(), 
            _controllerPass.text,
            _controllerName.text,
            _controllerCedula.text,
            _controllerEdad.text,
            _selectedOption,
            _selectedOption2,
            _selectedOption3,
            );
          if (userCredential.user != null) {
            await userCredential.user!.updateDisplayName(_controllerName.text);
            showMessage("Listo.", Colors.green);
            
            redirect();
          }
        }   catch (e) {
          showMessage("Error: $e", Colors.red);
          setState(() {
            isLoading = false;
          });
        }
      }else{
        showMessage('Verifique todos los campos', Colors.red);
      }

    }

    void checkOptions(){
      if(_selectedOption == null ||  _selectedOption2 == null || _selectedOption3 == null ){
        showMessage('Verifica los campos de opcion multiple.', Colors.red);
      }else{
        createUser();
      }
    }

    return Scaffold(
    
      body: SingleChildScrollView(
        child: Container(
          color: kBackgroundColor,
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [

                const SizedBox(height: 50),

                _textRegister(),

                const SizedBox(height: 30),

                _textFormName(),
                
                const SizedBox(height: 10),

                _textFormId(),

                const SizedBox(height: 10),

                _textFormAge(),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    _dropdownGender(),

                    _dropdownExp()           
                    
                  ],
                ),

                _dropdownAcademic(),

                const SizedBox(height: 10),

                _textFormEmail(),

                const SizedBox(height: 10),

                _textFormPass(),

                const SizedBox(height: 20),

                isLoading?
                const LinearProgressIndicator():
                ElevatedButton(
                  onPressed: () {
                    checkOptions();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: const Color.fromARGB(255, 59, 177, 4), // Color del texto del botón
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), // Radio de los bordes del botón
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 15), // Espaciado interno del botón
                    textStyle: const TextStyle(fontSize: 18), // Estilo del texto del botón
                  ),
                  child: const Text('Registrarse'),
                ),

                const SizedBox(
                  height: 20,
                ),

                ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: const Color.fromARGB(255, 156, 163, 168), // Color del texto del botón
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), // Radio de los bordes del botón
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 15), // Espaciado interno del botón
                    textStyle: const TextStyle(fontSize: 18), // Estilo del texto del botón
                  ),
                  child: const Text('Atras'),
                ),

                const SizedBox(
                  height: 200,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textRegister(){
    return Text("Registrarse", style: kJakartaHeading2.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * kHeading2,
                  color: kWhiteColor
                ) );
  }
  
  Widget _textFormName(){
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
                    controller: _controllerName,
                    decoration: const InputDecoration(labelText: 'Nombre de usuario'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa un nombre de usuario';
                      }
                      return null;
                    },
                   
                  ),
                );
  }

  Widget _textFormId(){
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
                    controller: _controllerCedula,
                    decoration: const InputDecoration(labelText: 'Cedula'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su cedula';
                      }
                      return null;
                    },
                   
                  ),
                );
  }

  Widget _textFormAge(){
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
                    controller: _controllerEdad,
                    decoration: const InputDecoration(labelText: 'Edad'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su Edad';
                      }
                      return null;
                    },
                   
                  ),
                );
  }

  Widget _dropdownGender(){
    return DropdownButton<String>(
                        value: _selectedOption,
                        dropdownColor: kBackgroundColor,
                        hint: Text('Genero', style: kJakartaBodyRegular.copyWith(
                          fontSize: SizeConfig.blockSizeHorizontal! * kHeading4,
                          color: kWhiteColor
                        )),
                        items: <String>['M', 'F'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: kJakartaBodyRegular.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * kHeading4,
                              color: const Color.fromARGB(255, 0, 255, 8),
                            ) ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedOption = newValue;
                          });
                        },
                      
                    );
  }

  Widget _dropdownExp(){
    return DropdownButton<String>(
                          dropdownColor: kBackgroundColor,
                          value: _selectedOption2,
                          hint: Text('  Experiencia        ', style: kJakartaBodyRegular.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * kHeading4,
                            color: kWhiteColor
                          )),
                          items: <String>['Sin experiencia', '1 a 3', 'Mayor a 3'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value, style: kJakartaBodyRegular.copyWith(
                                fontSize: SizeConfig.blockSizeHorizontal! * kHeading4,
                                color: const Color.fromARGB(255, 0, 255, 8)
                              ) ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedOption2 = newValue;
                            });
                          },
                        
                    );
  }

  Widget _dropdownAcademic(){
    return DropdownButton<String>(
                        dropdownColor: kBackgroundColor,
                        value: _selectedOption3,
                        hint: Text('N. Academico', style: kJakartaBodyRegular.copyWith(
                          fontSize: SizeConfig.blockSizeHorizontal! * kHeading4,
                          color: kWhiteColor
                        )),
                        items: <String>['Tecnico', 'Tecnologo o Profesional'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: FittedBox(
                              fit: BoxFit.scaleDown, // Ajusta el texto para que quepa dentro del espacio disponible
                              child: Text(
                                
                                value,
                                style: kJakartaBodyRegular.copyWith(
                                  fontSize: SizeConfig.blockSizeHorizontal! * kHeading4,
                                  color: const Color.fromARGB(255, 0, 255, 8)
                                )
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedOption3 = newValue;
                          });
                        },
                      );
  }

  Widget _textFormEmail(){
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
                    decoration: const  InputDecoration(labelText: 'Correo electrónico'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa tu correo electrónico';
                      }
                      // Aquí puedes agregar validaciones de formato de correo electrónico si lo deseas
                      return null;
                    },
                    
                  ),
                );
  }
  
  Widget _textFormPass(){
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
                    decoration: const  InputDecoration(labelText: 'Contraseña'),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa tu contraseña';
                      }
                     
                      return null;
                    },
                   
                  ),
                );
  }

}
