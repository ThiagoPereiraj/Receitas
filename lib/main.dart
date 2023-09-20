import 'package:flutter/material.dart';
import 'receita.dart';
import 'receita_detalhe.dart';

void main() {
  runApp(const ReceitasApp());
}

class ReceitasApp extends StatelessWidget {
  const ReceitasApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      title: 'Receitas',
      theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
        primary: Colors.grey,
        secondary: Colors.black,
      )),
      home: const MyHomePage(title: 'Receitas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
          child: ListView.builder(
        itemCount: Receita.samples.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ReceitaDetalhe(receita: Receita.samples[index]);
                  },
                ),
              );
            },
            child: buildReceitaCard(Receita.samples[index]),
          );
        },
      )),
    );
  }
}

Widget buildReceitaCard(Receita receita) {
  return Card(
    child: Column(
      children: <Widget>[
        Image(image: AssetImage(receita.imageUrl)),
        Text(receita.label),
      ],
    ),
  );
}
