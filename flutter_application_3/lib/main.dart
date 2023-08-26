import 'package:flutter/material.dart';
import 'Quote.dart';

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

  Widget quoteTemplate(quote){
    return new QuoteCard(quote: quote);
  }
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
        children: quoteList.map((quote) => quoteTemplate(quote)).toList(),
      )
    );
  }

}

class QuoteCard extends StatelessWidget {
  
  final Quote quote;
  QuoteCard({required this.quote});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
            Text(
              quote.text,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16.0,
              ),
            ),
      
            SizedBox(height: 6.0),
      
            Text(
              quote.author,
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 14.0,
              ),
            )
      
          ],
        ),
      )
    );
  }
}