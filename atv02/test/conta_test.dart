import 'package:test/test.dart';
import '../lib/main.dart';

void main() {
  group('Teste de Conta com int', () {
    test('Deve criar uma conta com saldo inicial e permitir depósitos e saques', () {
      final conta = Conta<int>(100);

      expect(conta.consultarSaldo(), 100);

      conta.depositar(50);
      expect(conta.consultarSaldo(), 150);

      conta.sacar(30);
      expect(conta.consultarSaldo(), 120);
    });
  });

  group('Teste de Conta com double', () {
    test('Deve criar uma conta com saldo inicial e permitir depósitos e saques com valores decimais', () {
      final conta = Conta<double>(100.50);

      expect(conta.consultarSaldo(), 100.50);

      conta.depositar(50.75);
      expect(conta.consultarSaldo(), 151.25);

      conta.sacar(30.25);
      expect(conta.consultarSaldo(), 121.00);
    });
  });
}