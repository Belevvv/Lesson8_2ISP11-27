import 'package:flutter/material.dart';
import 'package:flutter_application_4/baza/mainbaza.dart';
import 'package:flutter_application_4/nebaza/mainbaza1.dart';

import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Cart(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Список книг'),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
          ),
          itemCount: BoookList.length,
          itemBuilder: (BuildContext context, int index) {
            return ConstrainedBox(
              child: ConstrBook(
                id: index,
                onPressed: () =>
                    Provider.of<Cart>(context, listen: false)
                        .addItemToCart(BoookList[index]),
              ),
              constraints: const BoxConstraints(
                maxHeight: 100,
                maxWidth: 100,
              ),
            );
          },
        ),
      ),
    );
  }
}