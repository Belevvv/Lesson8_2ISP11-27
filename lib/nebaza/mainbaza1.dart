import 'package:flutter/material.dart';
import 'package:flutter_application_4/baza/mainbaza.dart';
import 'package:flutter_application_4/nebaza/izbran1.dart';

class ConstrBook extends StatelessWidget {
  final int id;
  final VoidCallback onPressed;

  ConstrBook({
    super.key,
    required this.id,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.all(8),
      child: Column(children: [
        Center(
          child: Text(
            '${BoookList[id].nameB}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Image.network(BoookList[id].Book),
        ),
        Center(
          child: Text(
            'Цена: ${BoookList[id].Cost} руб.',
            softWrap: true,
            maxLines: 5,
            style: TextStyle(fontSize: 12),
          ),
        ),
        Center(
          child: Text(
            'Автор: ${BoookList[id].nameA}',
            softWrap: true,
            maxLines: 5,
            style: TextStyle(fontSize: 12),
          ),
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookPage(id: id)),
                );
              },
              icon: Icon(Icons.album_sharp),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => favoritbook(id: id)),
                );
              },
              icon: Icon(Icons.favorite),
            ),
            IconButton(
              onPressed: onPressed,
              icon: Icon(Icons.airline_stops_sharp),
            ),
          ],
        ),
      ]),
    );
  }
}

class BookPage extends StatelessWidget {
  const BookPage({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(BoookList[id].nameB),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          const Text('Описание:'),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500, maxHeight: 300),
            child: Container(
                padding: const EdgeInsets.all(1),
                color: Colors.grey,
                child: Container(
                  padding: EdgeInsets.all(4),
                  color: Colors.white,
                  child: ListView(
                    children: [Text(BoookList[id].info)],
                  ),
                )),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500, maxHeight: 300),
            child: PageView(
              children: BoookList[id].GetListOfPhoto(),
            ),
          ),
        ],
      ),
    );
  }
}