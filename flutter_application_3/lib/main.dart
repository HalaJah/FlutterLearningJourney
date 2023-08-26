import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

void main() => runApp(MaterialApp(
  home: QuoteList(),
));

class QuoteList extends StatefulWidget{
  @override
  _QuoteListState createState() => _QuoteListState();

}

class _QuoteListState extends State<QuoteList>{

  List<Quote> quoteList = [
    Quote(text: 'The fastest road to meaning and success: choose one thing and go all in', author: 'Hala Jahjah'),
    Quote(text:'Try again. Fail again. Fail better.', author: 'Ghaida Jahjah'),
    Quote(text:'Don’t tell people your plans. Show them your results.', author: 'Safaa Aboassaf')
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
        children: quoteList.map((quote) => QuoteCard(quote: quote)).toList(),
      )
    );
  }

}

