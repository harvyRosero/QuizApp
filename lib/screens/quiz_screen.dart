import 'package:flutter/material.dart';
import 'package:quiz/util/question_model.dart';
import 'package:quiz/util/app.styles.dart';
import 'package:quiz/util/size.congif.dart';
import 'package:quiz/util/shared_pref.dart';
import 'package:quiz/util/firebase.helper.dart';
import 'package:intl/intl.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  //define the datas
  final Preferences preferences = Preferences();
  final FirebaseService firebaseService = FirebaseService();
  List<Question> questionList = getQuestions();
  int currentQuestionIndex = 0;
  int score = 0;
  Answer? selectedAnswer;
  String userId = "";
  late DateTime currentDateTime;
  bool eraserAnswer = false;
  List<Map<String, dynamic>> datos = [];

  String name = '';
  String email = '';
  String cedula = '';
  String edad = '';
  String genero = '';
  String nivel = '';
  String experiencia = '';

  void getUserId () async{
    String? id = await preferences.getUserID();
    datos = await firebaseService.getDataByUserId(id.toString());

    setState(() {
      userId = id.toString();
      name = datos[0]['name'];
      email = datos[0]['email'];
      cedula = datos[0]['cedula'];
      edad = datos[0]['edad'];
      genero = datos[0]['genero'];
      experiencia = datos[0]['experiencica'];
      nivel = datos[0]['nivel'];
    });
  }

  @override
  void initState(){
    super.initState();
    getUserId();
  }


  void sendResult(userId_, puntaje_, state_ ){
    currentDateTime = DateTime.now();
    String fecha = DateFormat('yyyy-MM-dd HH:mm:ss').format(currentDateTime).toString();
    firebaseService.addUserResult(
      userId, 
      fecha, 
      puntaje_, 
      state_, 
      name, 
      email, 
      cedula, 
      edad, 
      genero, 
      nivel, 
      experiencia );
  }
  

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 50, 80),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child:
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround, 
                children: [

                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: _logo(),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                   Text(
                    "Prueba Tecnica alimentos",
                    style: kJakartaBodyRegular.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * kHeading3,
                      color: kWhiteColor
                    )
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                _questionWidget(),

                const SizedBox(
                    height: 20,
                  ),
                _answerList(),

                const SizedBox(
                    height: 20,
                  ),

                _nextButton(),
          ]),
        ),
      ),
    );
  }

  _logo() {
    return Column(
      children: [
        Image.asset('assets/images/img2.png', )
      ],
    );
  }

  _questionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Pregunta ${currentQuestionIndex + 1}/${questionList.length.toString()}",
          style: kJakartaBodyBold.copyWith(
            fontSize: SizeConfig.blockSizeHorizontal! * kHeading4,
            color: kWhiteColor
          )
        ),
        const SizedBox(height: 20),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            questionList[currentQuestionIndex].questionText,
            style: kJakartaHeading2.copyWith(
              fontSize: SizeConfig.blockSizeHorizontal! * kHeading4, 
              color: kWhiteColor
            )
          ),
        )
      ],
    );
  }

  _answerList() {
    return Column(
      children: questionList[currentQuestionIndex]
          .answersList
          .map(
            (e) => _answerButton(e),
          )
          .toList(),
    );
  }

  Widget _answerButton(Answer answer) {
    bool isSelected = answer == selectedAnswer;

    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 8,),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: isSelected ? 
            Colors.white : Colors.black, 
            backgroundColor: isSelected ? 
              Colors.orangeAccent : Colors.white, 
                shape: const StadiumBorder(),
        ),
        onPressed: () {
          
          if (selectedAnswer == null) {
            
            if (answer.isCorrect) {
              score++;               
            }
            setState(() {
              selectedAnswer = answer;
            });
          }

        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
          child: Text(answer.answerText),          
        ),
      ),
    );
  }


  _nextButton() {
    bool isLastQuestion = false;
    if (currentQuestionIndex == questionList.length - 1) {
      isLastQuestion = true;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        

        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          height: 48,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Colors.blueAccent, shape: const StadiumBorder(),
            ),
            onPressed: () {
              if (isLastQuestion) {
                showDialog(context: context, builder: (_) => _showScoreDialog());
              } else {
                //next question
                setState(() {
                  selectedAnswer = null;
                  currentQuestionIndex++;
                });
              }
            },
            child: Text(isLastQuestion ? "Enviar" : "Siguiente"),
          ),
        ),
      ],
    );
  }

  _showScoreDialog() {
    bool isPassed = false;

    if (score >= questionList.length * 0.6) {
      //pass if 60 %
      isPassed = true;
    }
    String title = isPassed ? "Aprobado" : "Reprobado";

    return AlertDialog(
      title: Text(
        "$title | Score is $score",
        style: TextStyle(color: isPassed ? Colors.green : Colors.redAccent),
      ),
      content: ElevatedButton(
        child: const Text("Terminar"),
        onPressed: () {
          sendResult( userId,  '$score/15', title );
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
          setState(() {
            currentQuestionIndex = 0;
            score = 0;
            selectedAnswer = null;
          });
        },
      ),
    );
  }
}
