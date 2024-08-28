import 'package:flutter/material.dart';
import 'models/conta.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banco Flutter',
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
  final Conta<double> contaDouble = Conta<double>(3547.34);
  final TextEditingController _doubleDepositController = TextEditingController();
  final TextEditingController _doubleWithdrawController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Banco Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            
            Text('Saldo inicial: ${contaDouble.consultarSaldo()}'),
            TextField(
              controller: _doubleDepositController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Depósito'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  final deposito = double.tryParse(_doubleDepositController.text) ?? 0.0;
                  contaDouble.depositar(deposito);
                });
              },
              child: Text('Depositar '),
            ),
            TextField(
              controller: _doubleWithdrawController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Saque'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  final saque = double.tryParse(_doubleWithdrawController.text) ?? 0.0;
                  contaDouble.sacar(saque);
                });
              },
              child: Text('Sacar'),
            ),
          ],
        ),
      ),
    );
  }
}