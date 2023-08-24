import 'package:flutter/material.dart';
import 'package:quiz/util/app.styles.dart';
import 'package:quiz/util/size.congif.dart';
import 'package:quiz/util/learn_model.dart';

class LearnScreen extends StatefulWidget {
  const LearnScreen({super.key});

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {

  List<Question> questionList = getQuestions();
  int currentQuestionIndex = 0;
  int score = 0;
  Answer? selectedAnswer;

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);

    return Scaffold(    
      backgroundColor: kBackgroundColor, 
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
                  


                   Text(
                    "Preparacion para prueba Tecnica alimentos",
                    textAlign: TextAlign.center,
                    style: kJakartaBodyRegular.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * kHeading3,
                      color: kWhiteColor,
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

  _questionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Documento ${currentQuestionIndex + 1}/${questionList.length.toString()}",
          style: kJakartaBodyBold.copyWith(
            fontSize: SizeConfig.blockSizeHorizontal! * kHeading4,
            color: kWhiteColor
          )
        ),
        const SizedBox(height: 20),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 0, 255, 8),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            questionList[currentQuestionIndex].questionText,
            textAlign: TextAlign.center,
            style: kJakartaHeading2.copyWith(
              fontSize: SizeConfig.blockSizeHorizontal! * kHeading4, 
              color: Colors.black
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

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kWhiteColor
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(answer.answerText, style: kJakartaBodyRegular.copyWith(
            fontSize: SizeConfig.blockSizeHorizontal! * kHeading4,
          )),

          Container(
            padding: const EdgeInsets.only(left: 10, right:10, top:20 ),
            child: Image.asset(answer.image),
          )
        ],
      ),
      
    );
  }

  _nextButton() {
    bool isLastQuestion = false;
    if (currentQuestionIndex == questionList.length - 1) {
      isLastQuestion = true;
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Colors.blueAccent, shape: const StadiumBorder(),
        ),
        onPressed: () {
          if (isLastQuestion) {
            //display score

            Navigator.pop(context);
          } else {
            //next question
            setState(() {
              selectedAnswer = null;
              currentQuestionIndex++;
            });
          }
        },
        child: Text(isLastQuestion ? "Listo" : "Next"),
      ),
    );
  }

  

}