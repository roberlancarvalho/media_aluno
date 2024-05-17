import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Média Aluno',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController nota1Controller = TextEditingController();
  TextEditingController nota2Controller = TextEditingController();
  double media = 0.0;
  String nomeAluno = "";

  void calcularMedia() {
    double nota1 = double.tryParse(nota1Controller.text) ?? 0.0;
    double nota2 = double.tryParse(nota2Controller.text) ?? 0.0;
    setState(() {
      media = (nota1 + nota2) / 2;
    });
  }

  void limparCampos() {
    setState(() {
      nomeController.clear();
      nota1Controller.clear();
      nota2Controller.clear();
      media = 0.0;
      nomeAluno = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Média Aluno'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(labelText: 'Nome do Aluno'),
              onChanged: (text) {
                setState(() {
                  nomeAluno = text;
                });
              },
            ),
            SizedBox(height: 16),
            TextField(
              controller: nota1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Nota 1'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: nota2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Nota 2'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: calcularMedia,
              child: Text('Calcular Média'),
            ),
            SizedBox(height: 16),
            Text(
              'Média: ${media.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: limparCampos,
              child: Text('Limpar'),
            ),
            SizedBox(height: 16),
            Text(
              'Nome: $nomeAluno',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
