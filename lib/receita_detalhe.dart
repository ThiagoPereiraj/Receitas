import 'package:flutter/material.dart';
import 'receita.dart';

class ReceitaDetalhe extends StatefulWidget {
  final Receita receita;
  const ReceitaDetalhe({Key? key, required this.receita}) : super(key: key);
  @override
  State<ReceitaDetalhe> createState() {
    return _ReceitaDetalheState();
  }
}

class _ReceitaDetalheState extends State<ReceitaDetalhe> {
  int _sliderVal = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receita.label),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.receita.imageUrl),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.receita.label,
              style: const TextStyle(fontSize: 18),
            ),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(7.0),
                  itemCount: widget.receita.ingredients.length,
                  itemBuilder: (BuildContext context, int index) {
                    final ingredient = widget.receita.ingredients[index];

                    return Text('${ingredient.quantity * _sliderVal} '
                        '${ingredient.measure} '
                        '${ingredient.name}');
                  }),
            ),
            Slider(
              min: 1,
              max: 10,
              divisions: 9,
              label: '${_sliderVal * widget.receita.servings} servings',
              value: _sliderVal.toDouble(),
              onChanged: (newValue) {
                setState(() {
                  _sliderVal = newValue.round();
                });
              },
              activeColor: Colors.green,
              inactiveColor: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
