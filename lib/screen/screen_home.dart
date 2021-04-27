import 'package:flutter/material.dart';
import 'package:myapp2/model/model_quiz.dart';
import 'package:myapp2/screen/screen_quiz.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Quiz> quizs = [
    Quiz.fromMap({
      'title':'test',
      'candidates':['a','b','c','d'],
      'answer':0
    }),
    Quiz.fromMap({
      'title':'test2',
      'candidates':['a','b','c','d'],
      'answer':0
    }),
    Quiz.fromMap({
      'title':'test3',
      'candidates':['a','b','c','d'],
      'answer':0
    }),
  ];
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("My Quiz App"),
        backgroundColor: Colors.deepPurple,
        leading: Container(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
              child: Image.asset(
            'images/quiz.jpeg',
            width: width * 0.8,
          )),
          Padding(padding: EdgeInsets.all(width * 0.024)),
          Text("퀴즈를 풀기전 안내사항입니다. \n 이퀴즈를 풀기전에 꼭 확인하세요",
              textAlign: TextAlign.center),
          Padding(padding: EdgeInsets.all(width * 0.048)),
          buildcStep(width,"1. 최초 3문제가 줄제 됩니다."),
          buildcStep(width,"2. 분야별로 문제를 선택할수 있습니다."),
          buildcStep(width,"3. 전체 문제를 다 푼경우, 보너스가 주어집니다."),
          Padding(padding: EdgeInsets.all(width * 0.048)),
          Container(
            padding:EdgeInsets.only(bottom: width * 0.036),
            child: Center(
              child:ButtonTheme(
                minWidth: width * 0.8,
                height: height * 0.05,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: RaisedButton(
                  child:Text(
                      "지금 퀴즈 풀기",
                      style:TextStyle(color: Colors.white)
                  ),
                  color: Colors.deepPurple,
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuizScreen(
                              quizs:quizs,
                            )
                        ),
                    );
                  },
                ),
              )
            ),
          )

        ],
      ),
    ));
  }

  Widget buildcStep(double width, String title) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          width * 0.048, width * 0.024, width * 0.048, width * 0.024),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.check_box,
            size: width * 0.04,
          ),
          Padding(padding: EdgeInsets.only(right: width * 0.024)),
          Text(title),
        ],
      ),
    );
  }
}
