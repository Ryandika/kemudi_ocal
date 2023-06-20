import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_regist/components/option_card.dart';
import 'package:login_regist/main.dart';
import 'package:login_regist/models/db_connect.dart';
import 'package:login_regist/models/question_models.dart';
import 'package:login_regist/screen/quiz_result.dart';
import 'package:login_regist/widgets/question.dart';
import '../components/next_quiz_button.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  var db = DBConnect();


  late Future _questions;

  Future<List<Question>> getData() async {
    return db.fetchQuestion();
  }

  @override
  void initState() {
    _questions = getData();
    super.initState();
  }


  int index = 0;
  bool isPressed = false;
  int score = 0;
  bool isAlreadyPressed = false;

  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isAlreadyPressed = false;
    });
    Navigator.pop(context);
  }

  void userOut() {
    FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
  }

  //function next btn quiz
  void nextQuestion(int questionLength) {
    if (index == questionLength - 1) {
      //question end
      showDialog(
        context: context,
        builder: ((context) => ResultPage(
              result: score,
              questionLength: questionLength,
              onTap: startOver,
            )),
      );
    } else {
      //user harus menekan salah satau tombol jika ingin melanjutkan pertanyaan
      if (isPressed) {
        setState(() {
          //index increment akan rebuild app
          index++;
          isPressed = false;
          isAlreadyPressed = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Center(child: Text('Pilih jawaban Anda')),
          duration: const Duration(seconds: 1),
          backgroundColor: colorScheme.secondary,
          behavior: SnackBarBehavior.floating,

          // margin: EdgeInsets.symmetric(vertical: 70),
          // padding: const EdgeInsets.symmetric(vertical: 20),
        ));
      }
    }
  }

  //function ontap check jawaban saat tombol pencet
  void checkAnswerAndUpdate(bool value) {
    if (isAlreadyPressed) {
      return;
    } else {
      if (value == true) {
        score++;
      }
      setState(() {
        isPressed = true;
        isAlreadyPressed = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _questions as  Future<List<Question>>,
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done){
          if(snapshot.hasError){
            return Center(
              child: Text(
                '${snapshot.error}'
              ),
            );
          }
          else if(snapshot.hasData) {
            var extractedData = snapshot.data as List<Question>;

            //tampilan quiz page
            return Scaffold(
              appBar: AppBar(
                title: const Text('Quiz Page'),
                backgroundColor: colorScheme.onPrimary,
                foregroundColor: colorScheme.onPrimaryContainer,
                // actions: [
                //   IconButton(onPressed: userOut, icon: const Icon(Icons.logout)),
                // ],
              ),
              body: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      'Nilai: $score',
                        style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    QuestionWidget(
                        indexAction: index,
                        question: extractedData[index].title,
                        totalQuestion: extractedData.length,
                    ),
                    const SizedBox(height: 20),
                    const Divider(color: Colors.black),
                    const SizedBox(height: 20),
                    for (int i = 0; i < extractedData[index].options.length; i++)
                  
                    GestureDetector(
                      // ontap change color
                      onTap: () => checkAnswerAndUpdate(
                        extractedData[index].options.values.toList()[i]),
    
                      child: OptionsCard(
                        optionCard: extractedData[index].options.keys.toList()[i],
                        
    
                        //function color card is pressed
                        colorCard: isPressed
                            ? extractedData[index].options.values.toList()[i] == true
                                ? colorScheme.onPrimaryContainer
                                : colorScheme.onErrorContainer
                           : colorScheme.onPrimaryContainer
                      ),
                    ),
                  ],
                ),
              ),


              floatingActionButton: GestureDetector(
                onTap: () => nextQuestion(extractedData.length),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                    child: NextButtonQuiz(
                      
                  ),
                ),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            );            
          }
        } 
        else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return const Center(
          child: Text('No Data'),
        );
      },
      
    );
  }
}