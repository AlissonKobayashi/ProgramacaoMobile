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
      home: FormScreen(),
    );
  }
}

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  List<Map<String, String>> _transactions = [];

  void _addTransaction() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _transactions.add({
          'name': _nameController.text,
          'amount': _amountController.text,
        });
      });
      _nameController.clear();
      _amountController.clear();
    }
  }

  void _navigateToList() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ListScreen(transactions: _transactions),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Transação'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira um nome';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _amountController,
                decoration: InputDecoration(labelText: 'Valor'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira um valor';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addTransaction,
                child: Text('Adicionar Transação'),
              ),
              ElevatedButton(
                onPressed: _navigateToList,
                child: Text('Ver Lista de Transações'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListScreen extends StatelessWidget {
  final List<Map<String, String>> transactions;

  ListScreen({required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Transações'),
      ),
      body: transactions.isEmpty
          ? Center(child: Text('Nenhuma transação adicionada.'))
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(transactions[index]['name']!),
                  subtitle: Text('Valor: ${transactions[index]['amount']}'),
                );
              },
            ),
    );
  }
}
