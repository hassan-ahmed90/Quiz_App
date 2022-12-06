import 'package:flutter/material.dart';
import 'package:new_quiz/brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:new_quiz/question.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  State<QuizPage> createState() => _QuizPageState();
}

List<Icon> scoreKeeper = [
  Icon(
    Icons.check,
    color: Colors.green,
  ),
  Icon(
    Icons.close,
    color: Colors.red,
  ),
];

class _QuizPageState extends State<QuizPage> {
  QueBank queBank = new QueBank();

  void checkingAns(bool userAns){
    bool answer = queBank.getAnswer();
    if(userAns==answer){
      
      scoreKeeper.add(Icon(Icons.check,color: Colors.green,));
    }
    else{
      scoreKeeper.add(Icon(Icons.close,color: Colors.red,));
    }
queBank.nextQuestion();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: Text(
                queBank.getQuest(),
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(15),
            child: InkWell(
              onTap: () {

                setState(() {
                  if(queBank.isFinished()==true){
                  Alert(
                    context: context,
                    title: "Question completed"
                  ).show();
                  scoreKeeper.clear();
                  queBank.reset();
                  }
                  else{
                    checkingAns(true);
                  }
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: Center(
                  child: Text(
                    'True',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          )),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.all(15),
                  child: InkWell(
                    onTap: () {

                      setState(() {
                        if(queBank.isFinished()==true){
                          scoreKeeper.clear();
                          Alert(
                            context: context,
                            title: "Question completed",
                          ).show();
                        }
                        else{
                          checkingAns(false);
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                      ),
                      child: Center(
                        child: Text(
                          'False',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ))),
          Row(
            children: scoreKeeper,
          )
        ],
      )),
    );
  }
}
