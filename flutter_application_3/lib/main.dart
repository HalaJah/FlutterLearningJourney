import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: QuoteList(),
));

class QuoteList extends StatefulWidget{
  @override
  _QuoteListState createState() => _QuoteListState();

}

class _QuoteListState extends State<QuoteList>{

  List<String> quoteList = [
    'The fastest road to meaning and success: choose one thing and go all in',
    'Try again. Fail again. Fail better.',
    'Don’t tell people your plans. Show them your results.'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.pink[900],
        title: Text('Awesome Quotes'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: quoteList.map((quote) {
          return Text(
            quote,
            style: TextStyle(
              fontSize: 15.0,
            )
          );
        }).toList(),
      )
    );
  }

}