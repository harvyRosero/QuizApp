import 'package:flutter/material.dart';
import 'package:quiz/screens/quiz_screen.dart';
import 'package:quiz/util/app.styles.dart';
import 'package:quiz/util/size.congif.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 50, 80),
      
      body: SingleChildScrollView(

        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),

              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Quiz", style: kJakartaHeading3.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * kHeading2,
                      color: kWhiteColor
                    ),),
                    IconButton(
                      onPressed: (){ Navigator.pushNamed(context, '/settings'); }, 
                      icon: const Icon(Icons.settings, color: kWhiteColor,)),
                      
                  ],
                ),
              ),

              const SizedBox(
                height: 40,
              ),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Center(

                  child: Text("PREPARADOR PRUEBAS TECNICAS PARA EL AREA DE  MANTENIMIENTO ", 
                    textAlign: TextAlign.center,
                    style: kJakartaHeading2.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * kHeading3,
                      color: kWhiteColor,
                    ),),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              
              
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 90),
                child: Image.asset('assets/images/img1.png', 
                  fit: BoxFit.cover,
                  ),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                elevation: 0,
                margin: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: const Color.fromARGB(255, 5, 50, 80),
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(20),
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const QuizScreen())));
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        elevation: 4,
                      ),
                      child: Text("INICIAR PREGUNTAS",
                          style: kJakartaHeading2.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * kHeading4,
                            color: Colors.black
                          )
                          ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/learn');
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        elevation: 4,
                      ),
                      child: Text("REPASAR",
                          style: kJakartaHeading2.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * kHeading4,
                            color: Colors.black
                          )
                          ),
                    ),

                    const SizedBox(
                      height: 30,
                    ),
                                        

                  ],
                ),
              ),

              const SizedBox(
                      height: 50,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
