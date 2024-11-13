

import "package:flutter/material.dart";



void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:quizapp(),
    );
  }
}
class quizapp extends StatefulWidget{
  const quizapp({super.key});
  @override
   State createState() =>_quizappState();
}
class _quizappState{
  List<Map> allQuestion =[
    {
      "question" :"who is founder of microsoft?",
      "options":["steve job","Bill Gates","Lary Page","Elon Musk"],
      "correctAnswer":1
    },
     {
      "question" :"who is founder of Google?",
      "options":["steve job","Bill Gates","Lary Page","Elon Musk"],
      "correctAnswer":2
    },
     {
      "question" :"who is founder of SpaceX?",
      "options":["steve job","Bill Gates","Lary Page","Elon Musk"],
      "correctAnswer":3
    },
     {
      "question" :"who is founder of Apple?",
      "options":["steve job","Bill Gates","Lary Page","Elon Musk"],
      "correctAnswer":0
    },
     {
      "question" :"who is founder of Meta?",
      "options":["steve job","Mark Zukerberg","Lary Page","Elon Musk"],
      "correctAnswer":1
    },
    
  ];

  int currentQuestionIndex=0;
  int selectedAnswerIndex=-1;
  WidgetStateProperty<Color?> checkAnswer(int answerIndex){
    if(selectedAnswerIndex !=-1){
        if(answerIndex==allQuestion[currentQuestionIndex]["correctAnswer"]){
          return const WidgetStatePropertyAll(Colors.green);
        }else if(selectedAnswerIndex==answerIndex){
          return const WidgetStatePropertyAll(Colors.red);
        }else {
          return const WidgetStatePropertyAll(null);
        }
    }else{
      return const WidgetStatePropertyAll(null);
    }
  }
   
   bool questionPage=true;
  @override
  Widget build(BuildContext context){
    return isQuestionScreen();
  }
  Scaffold isQuestionScreen(){
    if (questionPage==true){
      return Scaffold(
        appBar: AppBar(
          title:const Text(
            "Quiz App",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
             
            ),
            centerTitle: true,
            backgroundColor: Colors.blue,
        ),

        body: Column(
          
          children: [
            const SizedBox(height:30),

            Row(
              children:[
                const SizedBox(
                  width:130,
                ),
                Text(
                  "Qustion:${currentQuestionIndex+1}/${allQuestion.length}",
                  style:const TextStyle(
                     fontSize:30,
                     fontWeight: FontWeight.w700,
                     ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width:380,
              height: 50,
              child: Text(
                allQuestion[currentQuestionIndex]["question"],
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.purple,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
             ///option1
            SizedBox(
              width: 350,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkAnswer(0),
                 ),
                 onPressed:() {
                  if(selectedAnswerIndex==-1){
                    selectedAnswerIndex=0;
                    
                  }
                 },
                 child :Text(
                  "A.${allQuestion[currentQuestionIndex]['options'][0]}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  ),  

            ),

            ),
            const SizedBox(
              height:25,
            ),
            ///option2
             SizedBox(
              width: 350,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkAnswer(1),
                 ),
                 onPressed:() {
                  if(selectedAnswerIndex == -1){
                    selectedAnswerIndex=1;
                    setState(() {});
                  }
                 },
                 child :Text(
                  "B.${allQuestion[currentQuestionIndex]['options'][1]}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  ),  

            ),

            ),
             const SizedBox(
              height:25,
            ),
            ///option3
             SizedBox(
              width: 350,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkAnswer(2),
                 ),
                 onPressed:() {
                  if(selectedAnswerIndex == -1){
                    selectedAnswerIndex=2;
                    setState(() {});
                  }
                 },
                 child :Text(
                  "C.${allQuestion[currentQuestionIndex]['options'][1]}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  ),  

            ),

            ),
             const SizedBox(
              height:25,
            ),
            ///option4
             SizedBox(
              width: 350,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkAnswer(3),
                 ),
                 onPressed:() {
                  if(selectedAnswerIndex == -1){
                    selectedAnswerIndex=3;
                    setState(() {});
                  }
                 },
                 child :Text(
                  "D.${allQuestion[currentQuestionIndex]['options'][1]}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  ),  

            ),

            ),


          ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              if (selectedAnswerIndex !=-1){
                if(currentQuestionIndex<allQuestion.length-1){
                  currentQuestionIndex++;
                }else {
                  questionPage=false;
                }
                selectedAnswerIndex=-1;
                SetState((){});
              }
            },
            backgroundColor: Colors.blue,
            child: const Icon(
              Icons.forward,
              color:Colors.white,
            ),
          
          ),
      
      );
    }else{
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quiz result",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: Colors.white,
          
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://w7.pngwing.com/pngs/571/421/png-transparent-trophy-trophy-image-file-formats-trophy-objects-thumbnail.png",
                height: 300,
              ),
              const SizedBox(height: 30),
              const Text(
                "Congratulations",
                style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900,color: Colors.orange,),),
                const SizedBox(height: 30),
                const Text("Score :"),
            ],
          ),
        ),
      );
    }

  }
}