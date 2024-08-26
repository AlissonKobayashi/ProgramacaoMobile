import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicação Bancária',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplicação Bancária'),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text('Conta Corrente'),
              subtitle: Text('Saldo: R\$ 15.654,13'),
              trailing: Icon(Icons.chevron_right),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.savings),
              title: Text('Poupança'),
              subtitle: Text('Saldo: R\$ 270.135,40'),
              trailing: Icon(Icons.chevron_right),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.credit_card),
              title: Text('Cartão de Crédito'),
              subtitle: Text('Limite: R\$ 10.000,00'),
              trailing: Icon(Icons.chevron_right),
            ),
          ),
        ],
      ),
    );
  }
}
