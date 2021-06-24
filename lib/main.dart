import "package:flutter/material.dart";
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());/*The main method uses arrow (=>) notation. Use arrow notation for one-line functions or methods. */

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}

//ADD A STATEFUL WIDGET
//In this step, you'll add a stateful widget, 
//RandomWords, which create+s its State class, _RandomWordsState. 
//You'll then use RandomWords as a child inside the existing MyApp stateless widget.
class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}
//By default, the name of the State class is prefixed with an underscore.
class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];   
  //This Set stores the word pairings that the user favorited. 
  //Set is preferred to List because a properly implemented Set 
  //doesn't allow duplicate entries.              
  final _saved = <WordPair>{};  //NEW
  final _biggerFont = const TextStyle(fontSize: 18); 
  
  @override
  Widget build(BuildContext context){
    return Scaffold (                     // Add from here... 
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );                                      // ... to here.
  } 
  
    Widget _buildRow(WordPair pair) {
  //In the _buildRow function, add an alreadySaved check to 
  //ensure that a word pairing has not already been added to favorites.      
    final alreadySaved = _saved.contains(pair);  // NEW  
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(   // NEW from here... 
      alreadySaved ? Icons.favorite : Icons.favorite_border,
      color: alreadySaved ? Colors.red : null,
    ),
    );
}

//Next, you'll add a _buildSuggestions() function to the _RandomWordsState class. 
//This method builds the ListView that displays the suggested word pairing
  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      // The itemBuilder callback is called once per suggested 
      // word pairing, and places each suggestion into a ListTile
      // row. For even rows, the function adds a ListTile row for
      // the word pairing. For odd rows, the function adds a 
      // Divider widget to visually separate the entries. Note that
      // the divider may be difficult to see on smaller devices.
      itemBuilder: (BuildContext _context, int i) {
        // Add a one-pixel-high divider widget before each row 
        // in the ListView.
        if (i.isOdd) {
          return Divider();
        }

        // The syntax "i ~/ 2" divides i by 2 and returns an 
        // integer result.
        // For example: 1, 2, 3, 4, 5 becomes 0, 1, 1, 2, 2.
        // This calculates the actual number of word pairings 
        // in the ListView,minus the divider widgets.
        final int index = i ~/ 2;
        // If you've reached the end of the available word
        // pairings...
        if (index >= _suggestions.length) {
          // ...then generate 10 more and add them to the 
          // suggestions list.
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      }
    );
  }    // NEW
  }
    






