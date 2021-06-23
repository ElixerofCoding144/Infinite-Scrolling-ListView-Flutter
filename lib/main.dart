import "package:flutter/material.dart";
import 'package:english_words/english_words.dart';

//ADD A STATEFUL WIDGET
//In this step, you'll add a stateful widget, 
//RandomWords, which creates its State class, _RandomWordsState. 
//You'll then use RandomWords as a child inside the existing MyApp stateless widget.
void main() => runApp(MyApp());/*The main method uses arrow (=>) notation. Use arrow notation for one-line functions or methods. */

class RandomWords extends StatefulWidget{
  @override
  _RandomWordsState createState() => _RandomWordsState();
}
//By default, the name of the State class is prefixed with an underscore.
class _RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context){
    final wordPair = WordPair.random();      // NEW
    return Text(wordPair.asPascalCase);      // NEW
  }
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(                       // Drop the const, and
          child: RandomWords(),
        ),
      ),
    );
  }
}