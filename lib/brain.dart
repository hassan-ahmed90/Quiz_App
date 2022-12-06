import 'question.dart';
class QueBank{

  int _qNo =0;


  List<Question> _questoinBank =[
    Question(q:'This is the hassan   Ahmed ', a: true),
    Question(q: "Hello G Kia hal ha ", a: false),
    Question(q: 'Pakistan is the biggest country in the world ', a: false),
  ];

  String getQuest(){
    return _questoinBank[_qNo].questionTest;
  }
  bool getAnswer(){
    return _questoinBank[_qNo].answerText;
  }

  void nextQuestion(){
    if(_qNo< _questoinBank.length-1){
      _qNo++;
    }
    else{
    }
  }

  bool isFinished(){
    if(_qNo==_questoinBank.length-1){
      return true;
    }else
      return false;
  }

  void reset(){
    _qNo=0;
  }


}