import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main(){ 
  runApp(MyApp()); //MyApp is a user created widget that is built using flutter native widget MaterialApp
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(        
        primarySwatch: Colors.blue,      //color of title    
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //MaterialApp has a home property to specify the user interface of the home page,which is again a user created widget, RandomWords.
      home: RandomWords(title:'Demo1'),       
    );
  }
}

class RandomWords extends StatefulWidget {
  final  String title;
  RandomWords({Key key, this.title}) : super(key: key);  
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    //RandomWords is build using another flutter native widget, Scaffold
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:Center(
        /*child:Text('You have clicked the button this many times',
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                overflow: TextOverflow.ellipsis,
              )
        child: Text.rich(TextSpan(text:wordPair.asPascalCase,
                                       style:TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),
                                ),
        )
        child: Text.rich(TextSpan(
                            children:<TextSpan>[
                              TextSpan(text:wordPair.asPascalCase,
                                       style:TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),
                                      ),
                              TextSpan(text:wordPair.asPascalCase,
                                       style:TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),
                                      ),
                            ]
                         ),
                )*/
        /*child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Text>[
            Text(
              'You have clicked the button this many times:',
               style: Theme.of(context).textTheme.headline4, 
               textAlign: TextAlign.right,
               textDirection: TextDirection.ltr,
               overflow: TextOverflow.ellipsis,
            ),
            Text(
              wordPair.asPascalCase,
              style: TextStyle(fontWeight: FontWeight.bold),             
              textAlign: TextAlign.left,
              textDirection: TextDirection.ltr,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),*/
        child: Container(
          //padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 2.0),
          height:100.0,
          width: 100.0,
          decoration: const BoxDecoration(
            border: Border(
               top: BorderSide(width: 1.0, color: Colors.black),
               left: BorderSide(width: 1.0, color: Colors.black),
               right: BorderSide(width: 1.0, color: Colors.black),
               bottom: BorderSide(width: 1.0, color: Colors.black),
            ),
            //color: Colors.grey,
          ),
          child: Align(
              alignment: FractionalOffset(0.5, 0.6),
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 2.0),
                  decoration: const BoxDecoration(
                  border: Border(
                        top: BorderSide(width: 1.0, color: Colors.red),
                        left: BorderSide(width: 1.0, color: Colors.red),
                        right: BorderSide(width: 1.0, color: Colors.red),
                        bottom: BorderSide(width: 1.0, color: Colors.red),
                    ),
                    color: Colors.grey,
                  ),
                  child: const Text(
                    'OK',textAlign: TextAlign.center, style: TextStyle(color: Colors.black)
                  ), 
              ), 
          )
      ),
      ),
    );
    
  }
}

