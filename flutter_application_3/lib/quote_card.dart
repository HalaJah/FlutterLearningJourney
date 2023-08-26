import 'package:flutter/material.dart';
import 'quote.dart';

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
            ),

            SizedBox(height: 8.0),

           ElevatedButton.icon(
            onPressed: () {}, 
            icon: Icon(Icons.delete),
            label: Text('delete quote'),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink[200],
            ),
           )


      
          ],
        ),
      )
    );
  }
}