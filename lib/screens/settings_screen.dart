import 'package:flutter/material.dart';
import 'package:quiz/util/size.congif.dart';
import 'package:quiz/util/app.styles.dart';
import 'package:quiz/util/firebase.helper.dart';
import 'package:quiz/util/shared_pref.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  FirebaseService firebaseService = FirebaseService();
  final Preferences preferences = Preferences();
  List<Map<String, dynamic>> datos = [];

  String name = '';
  String email = '';
  String cedula = '';
  String edad = '';
  String genero = '';
  String nivel = '';
  String experiencia = '';

  void getData() async{
    String? userId = await preferences.getUserID();
    datos = await firebaseService.getDataByUserId(userId.toString());

    if(datos.isNotEmpty){
      setState(() {
        name = datos[0]['name'];
        email = datos[0]['email'];
        cedula = datos[0]['cedula'];
        edad = datos[0]['edad'];
        genero = datos[0]['genero'];
        experiencia = datos[0]['experiencica'];
        nivel = datos[0]['nivel'];
      });
    }
    
  }

  @override
  void initState(){
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
      ),
      bottomNavigationBar: Container(
        color: kBackgroundColor,
        child: GestureDetector(
                    onTap: (){ 
                      firebaseService.signOut(); 
                      Navigator.pushNamedAndRemoveUntil(context, '/' , (route) => false);
                      },
                    child: Container(
                      padding: const  EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: kWhiteColor,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 4,
                                  color: kBackgroundColor
                                )
                              ),
                            child: const Icon(Icons.logout),
                          ),
                          Expanded(
                            child: Text("  Cerrar Sesion", style: kJakartaBodyRegular.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * kHeading4,
                              color: kWhiteColor
                            ),)
                            )
                        ],
                        ),
                    ),
                  ),
      ),
        body: SingleChildScrollView(
            child: Container(
              color: kBackgroundColor,
              child: Column(
                
                children: [
            
                  Container(
                    height: 40,
                  ),

            
                  Stack(
                    children: const <Widget>[
                      CircleAvatar(
                        radius: 60.0,
                        backgroundImage: 
                          NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyC3KlHk3snYFP4HnCG8fFky0LFaNQsAou7Tr38omznxdFGJk0ZmiolvRndigUsFk3QIc&usqp=CAU")
                          
                      ),
                      
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 10),
                    child: Text(
                      name,
                      maxLines: 2,
                      style: kJakartaHeading2.copyWith(
                          fontSize: SizeConfig.blockSizeHorizontal! * kHeading2,
                          color: kDark40Color),
                    ),
                  ),
            
                  Container(
                    padding: const  EdgeInsets.only(right: 10, left: 10, top:10),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: kWhiteColor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color: kBackgroundColor
                              )
                            ),
                          child: const Icon(Icons.alternate_email),
                        ),
                        Expanded(
                          child: Text('Gmail: $email', style: kJakartaBodyRegular.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * kHeading4,
                            color: kWhiteColor
                          ),)
                          )
                      ],
                      ),
                  ),

                  Container(
                    padding: const  EdgeInsets.only(right: 10, left: 10, top:10),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: kWhiteColor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color: kBackgroundColor
                              )
                            ),
                          child: const Icon(Icons.person),
                        ),
                        Expanded(
                          child: Text('Cedula: $cedula', style: kJakartaBodyRegular.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * kHeading4,
                            color: kWhiteColor
                          ),)
                          )
                      ],
                      ),
                  ),

                  Container(
                    padding: const  EdgeInsets.only(right: 10, left: 10, top:10),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: kWhiteColor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color: kBackgroundColor
                              )
                            ),
                          child: const Icon(Icons.person_2_outlined),
                        ),
                        Expanded(
                          child: Text('Edad: $edad', style: kJakartaBodyRegular.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * kHeading4,
                            color: kWhiteColor
                          ),)
                          )
                      ],
                      ),
                  ),

                  Container(
                    padding: const  EdgeInsets.only(right: 10, left: 10, top:10),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: kWhiteColor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color: kBackgroundColor
                              )
                            ),
                          child: const Icon(Icons.person_3_sharp),
                        ),
                        Expanded(
                          child: Text('Genero: $genero', style: kJakartaBodyRegular.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * kHeading4,
                            color: kWhiteColor
                          ),)
                          )
                      ],
                      ),
                  ),

                  Container(
                    padding: const  EdgeInsets.only(right: 10, left: 10, top:10),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: kWhiteColor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color: kBackgroundColor
                              )
                            ),
                          child: const Icon(Icons.info),
                        ),
                        Expanded(
                          child: Text('Experiencia: $experiencia', style: kJakartaBodyRegular.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * kHeading4,
                            color: kWhiteColor
                          ),)
                          )
                      ],
                      ),
                  ),

                  Container(
                    padding: const  EdgeInsets.only(right: 10, left: 10, top:10),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: kWhiteColor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color: kBackgroundColor
                              )
                            ),
                          child: const Icon(Icons.document_scanner),
                        ),
                        Expanded(
                          child: Text('Nivel: $nivel', style: kJakartaBodyRegular.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * kHeading4,
                            color: kWhiteColor
                          ),)
                          )
                      ],
                      ),
                  ),
            
            
                  const SizedBox(
                    height: 200,
                  )
                ],
              ),
            )));
  }
}